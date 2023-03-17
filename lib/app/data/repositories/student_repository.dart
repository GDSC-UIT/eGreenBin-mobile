import 'package:egreenbin/app/data/models/student.dart';
import 'package:egreenbin/app/data/providers/apis/student_api.dart';
import 'package:egreenbin/app/data/providers/data_center.dart';
import 'package:egreenbin/app/domain/repositories/student_interface.dart';

class StudentRepository implements IStudentRepository {
  final studentApi = StudentAPI();

  @override
  // from api
  Future<List<Student>> fetchStudents() async {
    return await studentApi.fetchStudents();
  }

  @override
  Future<Student> getStudentByID(String id) async {
    return await studentApi.getStudentByID(id);
  }

  @override
  Future<Student> addStudent(Student student) async {
    // return student to add in local
    return await studentApi.addStudent(student);
  }

  // get student from local
  Student findStudentById(String id) {
    return DataCenter.instance.students.firstWhere((stu) => stu.id == id);
  }
}
