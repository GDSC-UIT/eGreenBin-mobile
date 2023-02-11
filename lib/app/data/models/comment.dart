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
}
