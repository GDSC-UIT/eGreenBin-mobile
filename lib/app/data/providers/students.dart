import 'package:egreenbin/app/data/models/student.dart';
import 'dart:convert';
import 'package:egreenbin/app/core/values/api_values.dart';
import 'package:egreenbin/app/data/services/http_service.dart';
import 'package:get/get.dart';

class Students extends GetxController {
  static RxList<Student> listStudents = <Student>[].obs;

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
    var response = await HttpService.getRequest(STUDENTS_URL);
    if (response.statusCode == 200) {
      final parsed = (json.decode(response.body)['data'] as List)
          .cast<Map<String, dynamic>>();
      print(response.body);
      List<Student> listGetStudents =
          parsed.map<Student>((json) => Student.fromJson(json)).toList();
      listStudents.value = listGetStudents;
    } else {
      throw Exception(
          'Failed to load student: ${jsonDecode(response.body)['error']}');
    }
  }

  static Future<void> addStudent(Student student) async {
    // post student
    var response = await HttpService.postRequest(
      url: STUDENTS_URL,
      body: jsonEncode(
        {
          'code': student.code,
          'name': student.name,
          'parentEmail': student.parentEmail,
          'numOfCorrect': student.numOfCorrect,
          'numOfWrong': student.numOfWrong,
          'imageAvatarUrl': student.imageAvatarUrl,
          'note': student.note,
        },
      ),
    );
    if (response.statusCode == 201) {
      // create new student
      final newStudent = Student(
        id: json.decode(response.body)['data']['id'],
        code: student.code,
        name: student.name,
        parentEmail: student.parentEmail,
        numOfCorrect: student.numOfCorrect,
        numOfWrong: student.numOfWrong,
        imageAvatarUrl: student.imageAvatarUrl,
        note: student.note,
      );
      // add to list
      listStudents.add(newStudent);
    } else {
      throw Exception(
          'Failed to add student: ${jsonDecode(response.body)['error']}');
    }
  }
}
