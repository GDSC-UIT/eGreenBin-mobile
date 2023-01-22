import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireBaseService {
  // upload image or file to firebase
  // return TaskSnapshot
  static Future uploadFile(PlatformFile? pickerFile) async {
    final path = 'file/${pickerFile!.name}';
    final file = File(pickerFile.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    UploadTask? uploadTask = ref.putFile(file);

    TaskSnapshot taskSnapshot = await uploadTask;

    return taskSnapshot;
  }
}
