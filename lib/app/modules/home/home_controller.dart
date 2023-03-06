import 'dart:io';

import 'package:egreenbin/app/core/values/http_values.dart';
import 'package:egreenbin/app/data/providers/garbages.dart';
import 'package:egreenbin/app/data/providers/students.dart';
import 'package:egreenbin/app/data/models/teacher.dart';
import 'package:egreenbin/app/data/services/http_service.dart';
import 'package:get/get.dart';
import '../../data/services/sort_service.dart';
import '../../routes/app_routes.dart';

class HomeController extends GetxController {
  HomeController() {
    sortService = SortService(
      updateSort: fnull,
    ).obs;
  }

  @override
  void onInit() async {
    // load list of garbages
    Garbages.gernerateGabages();
    refreshStudents();
    numberOfStudent = Students.listStudents.length.obs;
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

  RxBool isLoading = false.obs;
  Future refreshStudents() async {
    isLoading.value = true;
    // load list of garbages
    Garbages.gernerateGabages();
    // fetch student
    await Students.fetchStudent().then((value) {
      isLoading.value = false;
    });
  }

  // fuction of sort
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
  RxInt numberOfStudent = 0.obs;
  // sort box
  Rx<SortService>? sortService;

  // this is add student function
  File? imageStudent; // file image of student
  String code = "";
  String name = "";
  String parentEmail = "";
}
