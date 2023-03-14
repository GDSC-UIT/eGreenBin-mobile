import 'package:egreenbin/app/core/values/app_values.dart';

class Student {
  String? id; // id of student
  String? code; // code of student
  String name; // name of student
  int? numOfCorrect; // number of correct
  int? numOfWrong; // number of wrong
  String? imageAvatarUrl; // link url of image avatar student
  String? parentEmail; // email of parent's student
  String? note; // note when send email to parent's student

  Student({
    this.id,
    this.code,
    required this.name,
    this.numOfCorrect,
    this.numOfWrong,
    this.imageAvatarUrl,
    this.parentEmail,
    this.note,
  }) {
    id ??= DateTime.now.toString();
    numOfCorrect ??= 0;
    numOfWrong ??= 0;
    parentEmail ??= EmailValue.emailDefault;
    note ??= "";
  }

  // check this student has note?
  bool get isNote {
    return note != "";
  }

  //fetch student from json
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      parentEmail: json['parentEmail'],
      numOfCorrect: json['numOfCorrect'],
      numOfWrong: json['numOfWrong'],
      imageAvatarUrl: json['imageAvatarUrl'],
      note: json['note'],
    );
  }
}
