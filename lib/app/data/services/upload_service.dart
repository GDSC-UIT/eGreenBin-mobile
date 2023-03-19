import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:egreenbin/app/core/values/api_values.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class UploadService {
  static Future<void> uploadImage(File image) async {
    try {
      var uri = Uri.parse(FICEREGISTER);
      var request = http.MultipartRequest("POST", uri);
      request.files.add(await http.MultipartFile.fromPath(
        'img_save_name', // NOTE - this value must match the 'file=' at the start of -F
        image.path,
        contentType: MediaType('image', 'png'),
      ));
      final response = await http.Response.fromStream(await request.send());
      // check status
      if (response.statusCode == 200) {
        if (json.decode(response.body)["message"] ==
            "Image file need to be sent!") {
          log("Image file is null");
        } else {
          log("Succes to upload image");
        }
      } else {
        log('Failed to send image file to AI server: ${jsonDecode(response.body)['error']}');
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
