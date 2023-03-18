import 'package:egreenbin/app/data/providers/data_center.dart';
import '../models/notification.dart';

class NotificationRepository {
  void deleteNotification(Notification noti) {
    DataCenter.instance.notifications.remove(noti);
  }

  void addNotification(Notification noti) {
    DataCenter.instance.notifications.add(noti);
  }

  void deleteAllNotification() {
    DataCenter.instance.notifications.clear();
  }
}
