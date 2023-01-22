import 'dart:io';
import 'package:egreenbin/app/data/services/firebase_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../data/services/file_service.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  PlatformFile? pickerFile;
  UploadTask? uploadTask;

  Future selectFile() async {
    pickerFile = await FileService.selectFile();
    setState(() {});
  }

  Future uploadFile() async {
    uploadTask = await FireBaseService.uploadFile(pickerFile);
    setState(() {});
  }

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
    return Scaffold(
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
            buildProgress(),
          ],
        ),
      ),
    );
  }
}
