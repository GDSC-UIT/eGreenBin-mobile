import 'package:flutter/material.dart';

class Notification {
  String? id;
  Icon? icon;
  String title;
  String subtile;
  DateTime? dateCreate;

  Notification({
    this.id,
    this.icon,
    required this.title,
    required this.subtile,
    this.dateCreate,
  }) {
    id ??= DateTime.now().toString();
    dateCreate ??= DateTime.now();
    icon ??= const Icon(Icons.notifications_none);
  }
}
