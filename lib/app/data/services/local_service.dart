import 'package:file_picker/file_picker.dart';

class LocalService {
  // get file image from local
  //Image.file(File(pickerFile!.path!))
  static Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return null;
    return result.files.first;
  }

  // screenShot
}
