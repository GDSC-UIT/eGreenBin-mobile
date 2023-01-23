import 'dart:io';
import 'package:egreenbin/app/data/services/firebase_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import '../../../data/services/local_service.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  PlatformFile? pickerFile;
  UploadTask? uploadTask;

  Future selectFile() async {
    pickerFile = await LocalService.selectFile();
    setState(() {});
  }

  Future uploadFile() async {
    uploadTask = await FireBaseService.uploadFile(pickerFile);
    setState(() {});
  }

  Future saveImage(Uint8List bytes) async {
    // doi cho phep luu
    await [Permission.storage].request();
    // luu
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'screenshot_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result['filePath'];
  }

  // screen shot
  final screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    Widget buildProgress() => StreamBuilder<TaskSnapshot>(
          stream: uploadTask?.snapshotEvents,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              double progress = data!.bytesTransferred / data.totalBytes;
              return SizedBox(
                height: 50,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.grey,
                      color: Colors.green,
                    ),
                    Center(
                      child: Text(
                        '${(100 * progress).roundToDouble()}%',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox(height: 50);
            }
          },
        );
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (pickerFile != null)
                Expanded(
                  child: Container(
                    color: Colors.blue[100],
                    child: Center(
                      child: Image.file(
                        File(pickerFile!.path!),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: selectFile,
                child: const Text("Select File"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: uploadFile,
                child: const Text("Upload"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  final image = await screenshotController.capture();
                  if (image == null) return;
                  await saveImage(image);
                },
                child: const Text("Screen shot"),
              ),
              const SizedBox(height: 10),
              buildProgress(),
            ],
          ),
        ),
      ),
    );
  }
}
