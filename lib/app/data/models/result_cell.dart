import 'dart:core';

class ResultCell {
  String? id; // id of trash
  String idStudent; // id of student threw trash
  String? name;
  int right;
  int wrong;
  bool? isHappy;

  ResultCell({
    this.id,
    required this.idStudent,
    required this.name,
    required this.right,
    required this.wrong,
  }) {
    id ??= DateTime.now().toString();
    right >= wrong ? isHappy = true : isHappy = false;
  }
}
