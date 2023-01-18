import 'package:egreenbin/app/data/models/students.dart';
import 'package:egreenbin/app/data/models/teacher.dart';
import 'package:get/get.dart';
import '../../data/services/sort_service.dart';
import '../../routes/app_routes.dart';

class HomeController extends GetxController {
  HomeController() {
    sortService = SortService().obs;
    numberOfStudent = listStudent.value.listStudents.length.obs;
  }

  // function
  void pushToMailScreen() {
    Get.toNamed(AppRoutes.mail, arguments: teacher.value);
  }

  void pushToStudentInfoScreen(String id) {
    Get.toNamed(AppRoutes.studentInfo, arguments: id);
  }

  void refreshStudents() {}

  // data models
  Rx<Students> listStudent = Students().obs;

  Rx<Teacher> teacher = Teacher(
    id: '20521000',
    name: "Hoàng Thì Linh",
  ).obs;

  // class value
  RxInt numberOfStudent = 32.obs;
  // sort box
  Rx<SortService>? sortService;
}
