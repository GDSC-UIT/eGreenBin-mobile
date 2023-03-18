import 'package:egreenbin/app/core/extensions/date_ex.dart';
import 'package:egreenbin/app/data/models/notification.dart' as noti;
import 'package:egreenbin/app/data/repositories/notification_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/text_styles.dart';

// ignore: must_be_immutable
class CardNotification extends StatelessWidget {
  noti.Notification notification;
  NotificationRepository notiRepo;
  CardNotification(this.notification, this.notiRepo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              // delete task
              notiRepo.deleteNotification(notification);
            },
            icon: Icons.delete,
            backgroundColor: AppColors.wrong,
          ),
        ],
      ),
      child: Card(
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
                notification.dateCreate!.dayBeforeString,
                style: CustomTextStyle.b8(AppColors.subtle_2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
