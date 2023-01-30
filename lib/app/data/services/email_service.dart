import 'package:egreenbin/app/core/theme/app_colors.dart';
import 'package:egreenbin/app/core/values/app_values.dart';
import 'package:egreenbin/app/data/providers/notifications.dart';
import 'package:egreenbin/app/data/models/notification.dart' as noti;
import 'package:egreenbin/app/data/models/student.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailService {
  // ham gui email
  // student: student dang co
  // message: noi dung thong bao

  static Future sendEmail({
    required Student student,
    required String message,
  }) async {
    final url = Uri.parse(EmailValue.url);
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': EmailValue.serviceId,
        'template_id': EmailValue.templateId,
        'user_id': EmailValue.userId,
        'template_params': {
          'user_subject': EmailValue.subject,
          'user_author': EmailValue.authorName,
          'user_child_name': student.name,
          'user_message': message,
          'to_email': student.parentEmail,
          'user_email': EmailValue.emailFrom,
        }
      }),
    );
    // show snackbar
    Get.snackbar(
      'Thông báo',
      response.body,
      duration: const Duration(seconds: 2),
      backgroundColor:
          response.body == "OK" ? AppColors.primarySubtle1 : Colors.red,
    );
    // add notification
    Notifications.addNotification(noti.Notification(
      title: "Email service",
      subtile: response.body,
    ));
  }

  // ham send email bang launch url
  static Future launchEmail({
    required String toEmail,
    required String subject,
    required String message,
  }) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
}
