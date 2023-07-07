import 'package:egreenbin/app/data/repositories/notification_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:egreenbin/app/data/models/notification.dart' as noti;

void showSnackBarAndNotification(String title, String content, Color color) {
  NotificationRepository notiRepo = NotificationRepository();
  // show snackbar
  Get.snackbar(
    title,
    content,
    duration: const Duration(seconds: 2),
    backgroundColor: color,
  );
  // add notification
  notiRepo.addNotification(
    noti.Notification(
      title: title,
      subtile: content,
    ),
  );
}
