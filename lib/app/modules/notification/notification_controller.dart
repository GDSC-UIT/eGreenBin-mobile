import 'package:egreenbin/app/data/repositories/notification_repository.dart';
import 'package:get/get.dart';
import '../../data/models/teacher.dart';

class NotificationController extends GetxController {
  // noti repository
  final repoNoti = NotificationRepository();
  // fuction
  void popToPrevScreen() {
    Get.back();
  }

  void deleteAllNotification() {
    // delete all noti in list notification
    repoNoti.deleteAllNotification();
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
