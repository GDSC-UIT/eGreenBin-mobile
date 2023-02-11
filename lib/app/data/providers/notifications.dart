import 'package:get/get.dart';
import '../models/notification.dart';

class Notifications extends GetxController {
  static void deleteNotification(Notification noti) {
    listNotifications.remove(noti);
  }

  static void addNotification(Notification noti) {
    listNotifications.add(noti);
  }

  static void deleteAllNotification() {
    listNotifications.clear();
  }

  static RxList<Notification> listNotifications = <Notification>[
    /* Notification(
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
    ), */
  ].obs;
}
