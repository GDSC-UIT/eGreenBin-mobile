import 'student_info_controller.dart';
import 'package:get/get.dart';

class StudentInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentInfoController>(() => StudentInfoController());
  }
}
