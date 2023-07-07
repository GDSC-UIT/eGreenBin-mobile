import 'dart:developer';

import 'package:egreenbin/app/data/models/student.dart';
import 'package:egreenbin/app/data/providers/apis/student_api.dart';
import 'package:egreenbin/app/data/providers/data_center.dart';
import 'package:egreenbin/app/domain/repositories/student_interface.dart';

class StudentRepository implements IStudentRepository {
  final studentApi = StudentAPI();

  @override
  // from api
  Future<List<Student>> fetchStudents() async {
    DataCenter.instance.students.value = await studentApi.fetchStudents();
    return [...DataCenter.instance.students];
  }

  @override
  Future<Student> getStudentByID(String id) async {
    return await studentApi.getStudentByID(id);
  }

  @override
  Future<Student> addStudent(Student student) async {
    // return student to add in local
    Student? newStudent = await studentApi.addStudent(student);
    if (newStudent == null) {
      log("new student is null");
    }
    DataCenter.instance.students.add(newStudent!);
    return newStudent;
  }

  // get student from local
  Student findStudentById(String id) {
    return DataCenter.instance.students.firstWhere((stu) => stu.id == id);
  }

  // get length of list local student
  int getLengthOfListStudents() {
    return DataCenter.instance.students.length;
  }

  // get student from index
  Student getStudentFromIndex(int index) {
    return DataCenter.instance.students[index];
  }
}
