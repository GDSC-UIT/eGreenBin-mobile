import 'package:egreenbin/app/core/extensions/double_ex.dart';
import 'package:egreenbin/app/core/theme/app_colors.dart';
import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/data/services/device_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../home_controller.dart';

// ignore: must_be_immutable
class ImageAvatarPicker extends StatefulWidget {
  HomeController controller;
  ImageAvatarPicker(this.controller, {super.key});
  @override
  State<ImageAvatarPicker> createState() => _ImageAvatarPickerState();
}

class _ImageAvatarPickerState extends State<ImageAvatarPicker> {
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
                final image = await DeviceService.pickImage(ImageSource.camera);
                if (image == null) return;
                setState(() {
                  widget.controller.imageStudent = image;
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Gallery'),
              onTap: () async {
                final image =
                    await DeviceService.pickImage(ImageSource.gallery);
                if (image == null) return;
                setState(() {
                  widget.controller.imageStudent = image;
                });
                Navigator.of(context).pop();
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
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              // click on the image
              await showImageSoure(context);
            },
            child: widget.controller.imageStudent != null
                ? Image.file(
                    widget.controller.imageStudent!,
                    fit: BoxFit.cover,
                    width: 30.0.wp,
                    height: 30.0.wp,
                  )
                : Image.asset(
                    Assets.avatarDefault,
                    fit: BoxFit.cover,
                    width: 30.0.wp,
                    height: 30.0.wp,
                  ),
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) {
    return buildCircle(
      color: Colors.white,
      all: 3,
      child: buildCircle(
        color: color,
        all: 8,
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
