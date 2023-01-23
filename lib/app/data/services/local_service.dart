import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class LocalService {
  // get file image from local
  //Image.file(File(pickerFile!.path!))
  static Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return null;
    return result.files.first;
  }

  // screenShot

  // save image to local
  // input: an image
  static Future saveImage(Uint8List bytes) async {
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
}
