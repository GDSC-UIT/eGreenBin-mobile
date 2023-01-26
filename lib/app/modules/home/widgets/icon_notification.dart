import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/theme/app_colors.dart';
import '../../../core/values/assets_image.dart';
import '../../../core/values/theme/text_styles.dart';
import '../../../data/providers/notifications.dart';

class IconNotification extends StatelessWidget {
  const IconNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Notifications.listNotifications.isEmpty
          ? Image.asset(Assets.notification)
          : badges.Badge(
              position: badges.BadgePosition.topStart(top: -15, start: -15),
              badgeContent: Text(
                Notifications.listNotifications.length.toString(),
                style: CustomTextStyle.b1(Colors.white),
              ),
              badgeStyle: const badges.BadgeStyle(
                badgeColor: AppColors.primary1,
              ),
              child: Image.asset(Assets.notification),
            ),
    );
  }
}
