import 'package:egreenbin/app/data/models/teacher.dart';
import 'package:egreenbin/app/data/providers/apis/teacher_api.dart';
import 'package:egreenbin/app/domain/repositories/teacher_interface.dart';

class TeacherRepository implements ITeacherRepository {
  final teacherApi = TeacherAPI();

  @override
  Future<List<Teacher>> fetchTeachers() async {
    return await teacherApi.fetchTeachers();
  }

  @override
  Future<Teacher> getTeacherByID(String id) async {
    return await teacherApi.getTeacherByID(id);
  }
}
