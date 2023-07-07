import 'package:badges/badges.dart' as badges;
import 'package:egreenbin/app/data/providers/data_center.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/values/assets_image.dart';
import '../../../core/theme/text_styles.dart';

class IconNotification extends StatelessWidget {
  const IconNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DataCenter.instance.notifications.isEmpty
          ? Image.asset(Assets.notification)
          : badges.Badge(
              position: badges.BadgePosition.topStart(top: -15, start: -15),
              badgeContent: Text(
                DataCenter.instance.notifications.length.toString(),
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
