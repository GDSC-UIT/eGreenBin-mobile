import 'dart:developer';

import 'package:egreenbin/app/data/models/student.dart';
import 'dart:convert';
import 'package:egreenbin/app/core/values/api_values.dart';
import 'package:egreenbin/app/data/services/http_service.dart';

class StudentAPI {
  Future<List<Student>> fetchStudents() async {
    var response = await HttpService.getRequest(STUDENTS_URL);
    if (response.statusCode == 200) {
      final parsed = (json.decode(response.body)['data'] as List)
          .cast<Map<String, dynamic>>();
      List<Student> listGetStudents =
          parsed.map<Student>((json) => Student.fromJson(json)).toList();
      return listGetStudents;
    } else {
      throw Exception(
          'Failed to load student: ${jsonDecode(response.body)['error']}');
    }
  }

  Future<Student> getStudentByID(String id) async {
    var response = await HttpService.getRequestWithId(
      url: STUDENTS_URL,
      id: id,
    );
    if (response.statusCode == 200) {
      Student newStudent = Student.fromJson(json.decode(response.body)['data']);

      return newStudent;
    } else {
      throw Exception(
          'Failed to load student: ${jsonDecode(response.body)['error']}');
    }
  }

  Future<Student?> addStudent(Student student) async {
    // post student
    var response = await HttpService.postRequest(
      url: STUDENTS_URL,
      body: jsonEncode(
        student.toJson(),
      ),
    );
    if (response.statusCode == 201) {
      // create new student
      student.setID = json.decode(response.body)['data']['id'];
      // return newStudent to add in domain
      return student;
    } else {
      log('Failed to add student: ${jsonDecode(response.body)['error']}');
      return null;
    }
  }
}
