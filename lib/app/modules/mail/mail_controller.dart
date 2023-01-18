import 'package:get/get.dart';
import '../../data/models/students.dart';
import '../../data/models/teacher.dart';
import '../../data/services/sort_service.dart';

class MailController extends GetxController {
  MailController() {
    sortService = SortService().obs;
    numberOfStudent = listStudent.value.listStudents.length.obs;
  }

  // function
  void popToPrevScreen() {
    Get.back();
  }

  void sendMailToAll() {
    // send email to all parents
  }
  // sort box
  Rx<SortService>? sortService;
  // data models
  Rx<Students> listStudent = Students().obs;

  Rx<Teacher> teacher = Teacher(
    id: '20521000',
    name: "Hoàng Thì Linh",
  ).obs;

  // class value
  RxInt numberOfStudent = 32.obs;
}
