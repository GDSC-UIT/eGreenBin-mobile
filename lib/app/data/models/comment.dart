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
    print(type);
    if (type == "Date") {
      DateTime date = DateTime.parse(json['DateUpdated']);
      newSort = DateSort.fromDate(date: date);
    } else if (type == "Year") {
      int year = int.parse(json['DateUpdated']);
      newSort = DateSort.fromYear(year: year);
    } else {
      // type == month
      newSort = DateSort.fromMonth(month: json['DateUpdated']);
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
