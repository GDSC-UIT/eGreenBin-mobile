import 'dart:convert';
import 'package:egreenbin/app/data/models/teacher.dart';
import '../../../core/values/api_values.dart';
import '../../services/http_service.dart';

class TeacherAPI {
  Future<List<Teacher>> fetchTeachers() async {
    var response = await HttpService.getRequest(TEACHERS_URL);
    if (response.statusCode == 200) {
      final parsed = (json.decode(response.body)['data'] as List)
          .cast<Map<String, dynamic>>();
      print(response.body);
      List<Teacher> listGetTeachers =
          parsed.map<Teacher>((json) => Teacher.fromJson(json)).toList();
      return listGetTeachers;
    } else {
      throw Exception(
          'Failed to load teacher: ${jsonDecode(response.body)['error']}');
    }
  }

  Future<Teacher> getTeacherByID(String id) async {
    var response = await HttpService.getRequestWithId(
      url: TEACHERS_URL,
      id: id,
    );
    if (response.statusCode == 200) {
      Teacher newTeacher = Teacher.fromJson(json.decode(response.body)['data']);

      return newTeacher;
    } else {
      throw Exception(
          'Failed to load teacher: ${jsonDecode(response.body)['error']}');
    }
  }
}
