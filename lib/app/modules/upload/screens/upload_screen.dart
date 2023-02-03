import 'dart:io';

import 'package:egreenbin/app/data/services/local_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  PlatformFile? pickedFile;

  Future selectFile() async {
    pickedFile = await LocalService.selectFile();
    setState(() {});
  }

  Future uploadFile() async {
    final path = 'file/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    UploadTask? uploadTask = ref.putFile(file);

    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
    print("asdasdasdasdasd");
    print(taskSnapshot.ref.getDownloadURL());
    //return await uploadTask;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              if (pickedFile != null)
                Expanded(
                  child: Container(
                      color: Colors.blue[100],
                      child: Image.file(
                        File(pickedFile!.path!),
                        fit: BoxFit.cover,
                      )),
                ),
              ElevatedButton(
                onPressed: selectFile,
                child: Text('Selecte file'),
              ),
              ElevatedButton(
                onPressed: uploadFile,
                child: Text('Upload file'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
