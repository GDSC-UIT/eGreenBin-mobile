import 'package:egreenbin/app/modules/notification/widgets/card_notification_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/values/assets_image.dart';
import '../../../core/theme/text_styles.dart';
import '../../../global_widgets/appbar_teacher.dart';
import '../notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController controller =
        Get.find<NotificationController>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.backround), fit: BoxFit.fill),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
// appbar
                  AppbarTeacher(
                    "NOTIFICATION".tr,
                    controller.teacher.value,
                    controller.popToPrevScreen,
                    Image.asset(Assets.back),
                  ),
                  const SizedBox(height: 15),
                  CardNotificationList(controller),
                ],
              ),
// button right bottom
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    // xoa tat ca
                    controller.deleteAllNotification();
                  },
                  child: Container(
                    height: 44,
                    width: 123,
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    decoration: const BoxDecoration(
                      color: AppColors.normal,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.delete,
                            color: AppColors.surface,
                          ),
                          Text(
                            "Delete all".tr,
                            style: CustomTextStyle.b3(AppColors.surface),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
