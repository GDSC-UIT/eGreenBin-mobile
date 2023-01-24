import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class FireBaseService {
  // upload image or file to firebase
  // return TaskSnapshot
  static Future uploadFilePicker(PlatformFile? pickerFile) async {
    final path = 'file/${pickerFile!.name}';
    final file = File(pickerFile.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    UploadTask? uploadTask = ref.putFile(file);

    TaskSnapshot taskSnapshot = await uploadTask;

    return await uploadTask;
  }

  static Future<String> uploadImage(Uint8List? image) async {
    // convert image => file
    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/image.png').create();
    file.writeAsBytesSync(image!);
    // push to firebase
    final path = 'file/${file.path}';
    final ref = FirebaseStorage.instance.ref().child(path);
    UploadTask? uploadTask = ref.putFile(file);

    TaskSnapshot taskSnapshot = await uploadTask;

    return await taskSnapshot.ref.getDownloadURL();
    //return taskSnapshot;
  }
}
