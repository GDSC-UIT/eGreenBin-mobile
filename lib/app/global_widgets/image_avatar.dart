import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

// ignore: must_be_immutable
class ImageAvatar extends StatelessWidget {
  String imageAvatarUrl;
  ImageAvatar(this.imageAvatarUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: AppColors.background,
      child: imageAvatarUrl == null
          ? const Icon(
              Icons.person,
              color: AppColors.subtle_2,
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                imageAvatarUrl,
                fit: BoxFit.cover,
                height: 50,
                width: 50,
                // handle error when get image
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.person,
                    color: AppColors.subtle_2,
                  );
                },
              ),
            ),
    );
  }
}
