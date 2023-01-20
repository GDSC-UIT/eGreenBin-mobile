import 'package:egreenbin/app/data/models/date_sort.dart';

class Comment {
  String? id;
  String idStudent;
  String content;
  DateSort? dateSort;
  DateTime? dateCreate;

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
