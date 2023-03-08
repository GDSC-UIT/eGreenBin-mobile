import 'dart:io';
import 'package:egreenbin/app/core/theme/app_colors.dart';
import 'package:egreenbin/app/core/utils/snackbar.dart';
import 'package:egreenbin/app/data/models/student.dart';
import 'package:egreenbin/app/data/providers/garbages.dart';
import 'package:egreenbin/app/data/providers/students.dart';
import 'package:egreenbin/app/data/models/teacher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/services/firebase_service.dart';
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
  final formKey = GlobalKey<FormState>(); // key of form add student

  File? imageStudent; // file image of student
  String code = "";
  String name = "";
  String parentEmail = "";

  /// try submit a new student
  Future trySubmitAddStudent() async {
    final isValid = formKey.currentState!.validate();

    if (imageStudent == null) {
      // show snackbar
      showSnackBarAndNotification(
        "Error",
        "Please pick an image",
        AppColors.wrong,
      );
      return;
    }

    if (isValid) {
      formKey.currentState!.save();
      // submit
      await submitAddStudent();
      // delete file
      imageStudent = null;
    }
  }

  Future<void> submitAddStudent() async {
    try {
      // loading
      // upload file to firebase
      String urlImage = await FireBaseService.uploadFile(imageStudent!);
      // get link image
      print(urlImage);
      // create new student
      Student newStudent = Student(
        code: code.trim(),
        name: name.trim(),
        parentEmail: parentEmail.trim(),
        imageAvatarUrl: urlImage,
        numOfCorrect: 0,
        numOfWrong: 0,
        note: "",
      );
      // post student
      await Students.addStudent(newStudent);
      update();
      // catch error
    } catch (error) {
      print("Error when submit student: $error");
      showSnackBarAndNotification(
        "Error",
        "Error when submit student: $error",
        AppColors.wrong,
      );
    }
  }
}
