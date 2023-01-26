import 'package:egreenbin/app/data/models/notification.dart';
import 'package:egreenbin/app/data/models/notifications.dart';
import 'package:get/get.dart';
import '../../data/models/teacher.dart';

class NotificationController extends GetxController {
  NotificationController() {}

  // fuction
  void popToPrevScreen() {
    Get.back();
  }

  void deleteAllNotification() {
    // delete all noti in list notification
    //print("delete all");
  }

  @override
  void onInit() {
    // argument
    teacher.value = Get.arguments;
    super.onInit();
  }

  // data models
  Rx<Teacher> teacher = Teacher(
    id: '20521000',
    name: "Hoàng Thì Linh",
  ).obs;
}
