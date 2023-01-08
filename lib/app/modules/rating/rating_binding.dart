import 'rating_controller.dart';
import 'package:get/get.dart';

class RatingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RatingController>(() => RatingController());
  }
}
