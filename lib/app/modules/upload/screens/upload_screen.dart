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

  // upload file to firebase
  Future uploadFile1() async {
    // em coi tren youtube
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);

    UploadTask uploadTask = ref.putFile(file);
    // lỗi putFile ko đc
    TaskSnapshot taskSnapshot = await uploadTask;
    print("Da up xong");
    print(taskSnapshot.ref.getDownloadURL());
    return taskSnapshot.ref.getDownloadURL();
  }

  Future uploadFile() async {
    // ham nay em thu code của chat gpt
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final file = File(pickedFile!.path!);
      // Get reference to Firebase Storage
      final Reference storageReference =
          FirebaseStorage.instance.ref().child(fileName);

      // Upload file
      final UploadTask uploadTask = storageReference.putFile(file);
      print("dong nay chua bi loi");
      // Wait for upload to complete
      final TaskSnapshot storageTaskSnapshot = await uploadTask;
      print("dong nay bi loi");
      // duong dan downloadUrl
      print(storageTaskSnapshot.ref.getDownloadURL());
    } on FirebaseException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
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
                child: const Text('Selecte file'),
              ),
              ElevatedButton(
                onPressed: uploadFile1,
                child: const Text('Upload file'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
