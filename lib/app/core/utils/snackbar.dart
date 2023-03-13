import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/providers/notifications.dart';
import 'package:egreenbin/app/data/models/notification.dart' as noti;

void showSnackBarAndNotification(String title, String content, Color color) {
  // show snackbar
  Get.snackbar(
    title,
    content,
    duration: const Duration(seconds: 2),
    backgroundColor: color,
  );
  // add notification
  Notifications.addNotification(
    noti.Notification(
      title: title,
      subtile: content,
    ),
  );
}
