import 'package:egreenbin/app/core/extensions/date_ex.dart';
import 'package:egreenbin/app/data/models/date_sort.dart';
import 'package:egreenbin/app/data/models/student.dart';

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

  set setID(String id) => this.id = id;

  @override
  String toString() {
    String res = "";
    res += "id: $id\n";
    res += "idStudent: $idStudent\n";
    res += "content: $content\n";
    res += "dateSort: ${dateSort.toString()}\n";
    res += "dateCreate: ${dateCreate.toString()}\n";
    return res;
  }

  factory Comment.fromJson(Map<String, dynamic> json) {
    DateSort newSort;
    String type = json['type'];
    String dateUpdate = json['dateUpdated'];
    if (type == "Date") {
      DateTime date = DateTime.parse(dateUpdate);
      newSort = DateSort.fromDate(date: date);
    } else if (type == "Year") {
      int year = int.parse(dateUpdate);
      newSort = DateSort.fromYear(year: year);
    } else {
      // type == month
      newSort = DateSort.fromMonth(month: dateUpdate);
    }

    return Comment(
      id: json['id'],
      idStudent: json['studentID'],
      content: json['content'],
      dateCreate: DateTime.parse(json['dateCreated']),
      dateSort: newSort,
    );
  }

  // conver to map
  Map<String, dynamic> toJson() {
    // get sort type
    final String type = dateSort!.valueSort;
    // get string date sort
    final String dateUpdated = dateSort!.toJsonString();
    var map = {
      'studentID': idStudent,
      'content': content,
      'type': type,
      'dateCreated': dateCreate!.fommatDateTZ,
      'dateUpdated': dateUpdated,
    };
    return map;
  }
}
