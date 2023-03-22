import 'package:egreenbin/app/data/models/teacher.dart';
import 'package:egreenbin/app/data/providers/apis/teacher_api.dart';
import 'package:egreenbin/app/data/providers/data_center.dart';
import 'package:egreenbin/app/domain/repositories/teacher_interface.dart';

class TeacherRepository implements ITeacherRepository {
  final teacherApi = TeacherAPI();

  @override
  Future<List<Teacher>> fetchTeachers() async {
    DataCenter.instance.teachers.value = await teacherApi.fetchTeachers();
    return DataCenter.instance.teachers;
  }

  @override
  Future<Teacher> getTeacherByID(String id) async {
    return await teacherApi.getTeacherByID(id);
  }

  Teacher getTeacherByIndex(int index) {
    Teacher teacher = Teacher(
      code: '20521000',
      name: "Hoàng Thì Linh",
    );
    if (DataCenter.instance.teachers != []) {
      teacher = DataCenter.instance.teachers[index];
    }
    return teacher;
  }
}
