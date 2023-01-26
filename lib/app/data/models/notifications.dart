import 'package:get/get.dart';
import 'notification.dart';

class Notifications extends GetxController {
  static void deleteNotification(Notification noti) {
    listNotifications.remove(noti);
  }

  static void addNotification(Notification noti) {
    listNotifications.add(noti);
  }

  static RxList<Notification> listNotifications = [
    Notification(
      title: "Email",
      subtile: "Gửi email thành công.",
    ),
    Notification(
      title: "Refresh",
      subtile: "Load dữ liệu thành công.",
    ),
    Notification(
      title: "Refresh",
      subtile:
          "Load dữ liệu thành công.asdasdgALIugdfpaieusfdaiggdfQIGASBDCIUQasbcdoiqEB",
    ),
  ].obs;
}
