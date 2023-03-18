import 'package:egreenbin/app/data/models/teacher.dart';

abstract class ITeacherRepository {
  Future<List<Teacher>> fetchTeachers();
  Future<Teacher> getTeacherByID(String id);
}
