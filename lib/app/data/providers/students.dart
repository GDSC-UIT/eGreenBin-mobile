import 'package:egreenbin/app/data/models/student.dart';
import 'dart:convert';
import 'package:egreenbin/app/core/values/http_values.dart';
import 'package:egreenbin/app/data/services/http_service.dart';
import 'package:http/http.dart' as http;

class Students {
  static List<Student> listStudents = [
    /* Student(
      id: "21522345",
      name: "Nguyễn Thành Trung",
      numOfCorrect: 92,
      numOfWrong: 50,
    ),
    Student(
      id: "21522321",
      name: "Lê Xuân Quỳnh",
      numOfCorrect: 90,
      numOfWrong: 30,
      parentEmail: "xuanquynh.limerence@gmail.com",
    ),
    Student(
      id: "21522343",
      name: "Nguyễn Công Tấn Phát",
      numOfCorrect: 20,
      numOfWrong: 99,
    ),
    Student(
      id: "21522000",
      name: "Nguyễn Hữu Hiệu",
      numOfCorrect: 50,
      numOfWrong: 10,
    ),
    Student(
      id: "21525455",
      name: "Ngô Thu Hà",
      numOfCorrect: 5,
      numOfWrong: 1,
    ),
    Student(
      id: "21522455",
      name: "Cao Minh Quân",
      numOfCorrect: 5,
      numOfWrong: 1,
    ),
    Student(
      id: "21520345",
      name: "Phan Văn Minh",
      numOfCorrect: 100,
      numOfWrong: 0,
    ),
    Student(
      id: "21521345",
      name: "Tiến deptraicaotohocgioi",
      numOfCorrect: 0,
      numOfWrong: 100,
    ), */
  ];

  static Student findStudent(String id) {
    Student studentFind = Student(
      id: "null",
      name: "Default",
      numOfCorrect: 0,
      numOfWrong: 0,
    );
    for (var student in listStudents) {
      if (student.id == id) studentFind = student;
    }
    return studentFind;
  }

  static Future<void> fetchStudent() async {
    var response = await HttpService.getRequest(getStudentsUrl);
    if (response.statusCode == 200) {
      final parsed = (json.decode(response.body)['data'] as List)
          .cast<Map<String, dynamic>>();
      print(response.body);
      List<Student> listGetStudents =
          parsed.map<Student>((json) => Student.fromJson(json)).toList();
      listStudents = listGetStudents;
    } else {
      throw Exception('Failed to load student');
    }
  }
}
