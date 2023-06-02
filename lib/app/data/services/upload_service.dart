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

  static Future<void> uploadImageToAiServer(
      File imageFile, String imageName) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            "http://34.147.108.136/recognition/?to_gray=true&return_image_name=true"));
    // Thêm file ảnh vào yêu cầu đa phần
    var imageStream = http.ByteStream(imageFile.openRead());
    var length = await imageFile.length();
    var multipartFile = http.MultipartFile('img_file', imageStream, length,
        filename: imageFile.path);

    request.files.add(multipartFile);

    // Gửi yêu cầu và xử lý phản hồi
    var response = await request.send();

    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseString);
      // Truy cập và lấy giá trị từ JSON
      //var contentResponse = jsonResponse;
      print('Upload thành công! Phản hồi: $jsonResponse');
    } else {
      print('Upload thất bại. Mã lỗi: ${response.reasonPhrase}');
    }
  }

  static Future<void> uploadImagesToAiServer(
      List<File> imageFiles, List<String> imageNames) async {
    var request = http.MultipartRequest('POST',
        Uri.parse("http://34.142.151.62/register?to_gray=false&username=minh"));

    for (int i = 0; i < imageFiles.length; i++) {
      var imageFile = imageFiles[i];
      var imageName = imageNames[i];

      var imageStream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartFile = http.MultipartFile('img_files', imageStream, length,
          filename: imageName);

      request.files.add(multipartFile);
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseString);
      print('Upload thành công! Phản hồi: $jsonResponse');
    } else {
      print('Upload thất bại. Mã lỗi: ${response.reasonPhrase}');
    }
  }
}
