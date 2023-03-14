import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class ImageAvatar extends StatefulWidget {
  String? imageAvatarUrl;

  ImageAvatar({this.imageAvatarUrl, super.key});

  @override
  State<ImageAvatar> createState() => _ImageAvatarState();
}

class _ImageAvatarState extends State<ImageAvatar> {
  bool imageReady = false;

  @override
  void initState() {
    super.initState();
    checkImageValidity(widget.imageAvatarUrl!);
  }

  // check image url is valid
  checkImageValidity(String image) async {
    var url = Uri.parse(image);
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          imageReady = true; // It's valid
        });
      }
    } catch (e) {
      // TODO nothing special to do here
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      return CircleAvatar(
        radius: 25,
        backgroundColor: AppColors.background,
        child: !imageReady
            ? const Icon(
                Icons.person,
                color: AppColors.subtle_2,
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  widget.imageAvatarUrl!,
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                ),
              ),
      );
    } catch (error) {
      return const Icon(
        Icons.person,
        color: AppColors.subtle_2,
      );
    }
  }
}
