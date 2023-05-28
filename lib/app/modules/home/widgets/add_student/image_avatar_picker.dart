import 'package:egreenbin/app/core/extensions/double_ex.dart';
import 'package:egreenbin/app/core/theme/app_colors.dart';
import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/data/enums/sortType.dart';
import 'package:flutter/material.dart';
import '../../home_controller.dart';

// ignore: must_be_immutable
class ImageAvatarPicker extends StatefulWidget {
  HomeController controller;
  FaceType type; // left, center, right
  ImageAvatarPicker(this.controller, this.type, {super.key});
  @override
  State<ImageAvatarPicker> createState() => _ImageAvatarPickerState();
}

class _ImageAvatarPickerState extends State<ImageAvatarPicker> {
  double sizeImage = 20.0;

  Future<void> showImageSoure(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () async {
                await widget.controller.getImageFromCamera(widget.type);
                setState(() {});
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Gallery'),
              onTap: () async {
                await widget.controller.getImageFromGallery(widget.type);
                setState(() {});
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildImage(context),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(AppColors.normal),
          ),
        ],
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    return buildCircle(
      color: AppColors.primary1,
      all: 1,
      child: buildCircle(
        color: Colors.white,
        all: 1,
        child: ClipOval(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async {
                // click on the image
                await showImageSoure(context);
              },
              child: widget.type == FaceType.Left
                  ? showLeftFace()
                  : widget.type == FaceType.Center
                      ? showCenterFace()
                      : showCenterRight(),
            ),
          ),
        ),
      ),
    );
  }

  Widget showLeftFace() {
    if (widget.controller.imageStudentLeft != null) {
      return Image.file(
        widget.controller.imageStudentLeft!,
        fit: BoxFit.cover,
        width: sizeImage.wp,
        height: sizeImage.wp,
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(15),
        width: sizeImage.wp,
        height: sizeImage.wp,
        child: Image.asset(
          Assets.head_left,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  Widget showCenterFace() {
    if (widget.controller.imageStudentCenter != null) {
      return Image.file(
        widget.controller.imageStudentCenter!,
        fit: BoxFit.cover,
        width: sizeImage.wp,
        height: sizeImage.wp,
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(15),
        width: sizeImage.wp,
        height: sizeImage.wp,
        child: Image.asset(
          Assets.head_center,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  Widget showCenterRight() {
    if (widget.controller.imageStudentRight != null) {
      return Image.file(
        widget.controller.imageStudentRight!,
        fit: BoxFit.cover,
        width: sizeImage.wp,
        height: sizeImage.wp,
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(15),
        width: sizeImage.wp,
        height: sizeImage.wp,
        child: Image.asset(
          Assets.head_right,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  Widget buildEditIcon(Color color) {
    return buildCircle(
      color: Colors.white,
      all: 2,
      child: buildCircle(
        color: color,
        all: 5,
        child: const Icon(
          Icons.add_a_photo,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) {
    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        color: color,
        child: child,
      ),
    );
  }
}
