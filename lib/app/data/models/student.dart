import 'package:egreenbin/app/core/values/app_values.dart';

class Student {
  String? id; // id of student
  String name; // name of student
  int? numOfCorrect; // number of correct
  int? numOfWrong; // number of wrong
  String? imageAvatarUrl; // link url of image avatar student
  String? parentEmail; // email of parent's student
  String? note; // note when send email to parent's student

  Student({
    this.id,
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
      name: json['name'],
      parentEmail: json['parentEmail'],
      numOfCorrect: json['NumOfCorrect'],
      numOfWrong: json['NumOfWrong'],
      imageAvatarUrl: json['ImageAvatarUrl'],
      note: json['Note'],
    );
  }
}
