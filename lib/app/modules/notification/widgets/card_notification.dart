import 'package:egreenbin/app/data/models/notification.dart' as Noti;
import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';

// ignore: must_be_immutable
class CardNotification extends StatelessWidget {
  Noti.Notification notification;

  CardNotification(this.notification, {super.key});

  // get num of date between dateFrom to DateTo
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  String get dayBeforeString {
    if (daysBetween(notification.dateCreate!, DateTime.now()) == 0)
      return "Hôm nay";
    return "${daysBetween(notification.dateCreate!, DateTime.now())} ngày trước";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primarySubtle2,
      elevation: 0,
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.background,
          child: notification.icon,
        ),
        title: Text(
          notification.title,
          style: CustomTextStyle.b1(AppColors.normal),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.subtile,
              style: CustomTextStyle.b1(AppColors.subtle_1),
            ),
            const SizedBox(height: 5),
            Text(
              dayBeforeString,
              style: CustomTextStyle.b8(AppColors.subtle_2),
            ),
          ],
        ),
      ),
    );
  }
}
