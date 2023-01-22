import 'upload_controller.dart';
import 'package:get/get.dart';

class UploadBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadController>(() => UploadController());
  }
}
