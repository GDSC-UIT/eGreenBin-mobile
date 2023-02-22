import 'package:egreenbin/app/data/providers/garbages.dart';
import 'package:egreenbin/app/data/providers/students.dart';
import 'package:egreenbin/app/data/models/teacher.dart';
import 'package:get/get.dart';
import '../../data/services/sort_service.dart';
import '../../routes/app_routes.dart';

class HomeController extends GetxController {
  HomeController() {
    sortService = SortService(
      updateSort: fnull,
    ).obs;
    numberOfStudent = Students.listStudents.length.obs;
  }

  @override
  void onInit() {
    // load list of garbages
    Garbages.gernerateGabages();
    super.onInit();
  }

  // function
  Function fnull = () {
    // this is fake function
    // this fuction will do nothing
  };

  void pushToMailScreen() {
    Get.toNamed(AppRoutes.mail, arguments: teacher.value);
  }

  void pushToStudentInfoScreen(String id) {
    Get.toNamed(AppRoutes.studentInfo, arguments: id);
  }

  void pushToNotificationScreen() {
    Get.toNamed(AppRoutes.notification, arguments: teacher.value);
  }

  bool isLoading = false;
  Future refreshStudents() async {
    isLoading = true;
    // load list of garbages
    Garbages.gernerateGabages();
    await Future.delayed(const Duration(seconds: 2), () {
      isLoading = false;
    });
  }

  void filterByAll() {}
  void filterByDate() {}
  void filterByYear() {}
  void filterByMonth() {}

  // data models
  Rx<Teacher> teacher = Teacher(
    id: '20521000',
    name: "Hoàng Thì Linh",
  ).obs;

  // class value
  RxInt numberOfStudent = 32.obs;
  // sort box
  Rx<SortService>? sortService;
}
