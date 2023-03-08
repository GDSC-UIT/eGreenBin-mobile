import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class FireBaseService {
  /// upload image or file to firebase
  /// return TaskSnapshot
  static Future uploadFilePicker(PlatformFile? pickerFile) async {
    final path = 'file/${pickerFile!.name}';
    final file = File(pickerFile.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    UploadTask? uploadTask = ref.putFile(file);

    //TaskSnapshot taskSnapshot = await uploadTask;

    return await uploadTask;
  }

  /// upload Uint8List image to firebase
  /// return link to get image
  static Future uploadImage(Uint8List? image) async {
    // if null => stop
    if (image == null) {
      print("image is null");
      return "";
    }
    // convert image => file
    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/image.png').create();
    file.writeAsBytesSync(image);
    // push to firebase
    final path = 'file/${file.path}';
    final ref = FirebaseStorage.instance.ref().child(path);
    UploadTask? uploadTask = ref.putFile(file);

    TaskSnapshot taskSnapshot = await uploadTask;
    // return link get file
    return await taskSnapshot.ref.getDownloadURL();
  }

  /// upload file image to firebase
  /// return link to get image
  static Future uploadFile(File file) async {
    // push to firebase
    final path = 'avatarStudents/${file.path}';
    final ref = FirebaseStorage.instance.ref().child(path);
    UploadTask? uploadTask = ref.putFile(file);

    TaskSnapshot taskSnapshot = await uploadTask;
    // return link get file
    return await taskSnapshot.ref.getDownloadURL();
  }
}
