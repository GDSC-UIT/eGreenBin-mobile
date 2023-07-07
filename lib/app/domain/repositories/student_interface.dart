import 'package:egreenbin/app/data/models/student.dart';

abstract class IStudentRepository {
  Future<List<Student>> fetchStudents();
  Future<Student> getStudentByID(String id);
  Future<void> addStudent(Student student);
}
