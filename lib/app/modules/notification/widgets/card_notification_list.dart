import 'package:egreenbin/app/data/models/notifications.dart';
import 'package:egreenbin/app/modules/notification/notification_controller.dart';
import 'package:egreenbin/app/modules/notification/widgets/card_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';

class CardNotificationList extends StatelessWidget {
  final NotificationController controller;

  const CardNotificationList(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primarySubtle2,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow,
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 6), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
// danh sach thong bao
                const SizedBox(height: 25),
                Text(
                  "DANH SÁCH THÔNG BÁO",
                  style: CustomTextStyle.h2(AppColors.primary1),
                ),
                const SizedBox(height: 2),
                Obx(
                  () => Text(
                    "${Notifications.listNotifications.length} thông báo",
                    style: CustomTextStyle.b1(AppColors.subtle_1),
                  ),
                ),
                const SizedBox(height: 5),
// list notification
                Obx(
                  () => Expanded(
                    child: ListView.builder(
                      itemCount: Notifications.listNotifications.length,
                      itemBuilder: (context, i) =>
                          CardNotification(Notifications.listNotifications[i]),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
