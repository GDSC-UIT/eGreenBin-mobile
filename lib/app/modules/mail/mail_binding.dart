import 'package:get/get.dart';
import 'mail_controller.dart';

class MailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MailController>(() => MailController());
  }
}
