import 'dart:ffi';

import 'package:egreenbin/app/data/models/date_sort.dart';

class Comment {
  String? id; // id of comment
  String idStudent; // id of student of comment
  String content; // content of comment
  DateSort? dateSort; // xem class dateSort
  DateTime? dateCreate; // date create of comment

  Comment({
    this.id,
    required this.idStudent,
    required this.content,
    this.dateCreate,
    this.dateSort,
  }) {
    id ??= DateTime.now().toString();
    dateCreate ??= DateTime.now();
    dateSort ??= DateSort.fromDate(date: dateCreate);
  }

  factory Comment.fromJson(Map<String, dynamic> json) {
    DateSort newSort;
    String type = json['type'];

    if (type == "Date") {
      newSort = DateSort.fromDate(date: json['DateUpdated']);
    } else if (type == "Month") {
      newSort = DateSort.fromMonth(month: json['DateUpdated']);
    } else {
      // type == year
      newSort = DateSort.fromYear(year: json['DateUpdated']);
    }

    return Comment(
      id: json['id'],
      idStudent: json['Student']['id'],
      content: json['Content'],
      dateCreate: DateTime.parse(json['DateCreated']),
      dateSort: newSort,
    );
  }
}
