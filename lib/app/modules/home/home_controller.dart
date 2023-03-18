import 'dart:io';
import 'package:egreenbin/app/core/theme/app_colors.dart';
import 'package:egreenbin/app/core/utils/snackbar.dart';
import 'package:egreenbin/app/data/models/student.dart';
import 'package:egreenbin/app/data/providers/data_center.dart';
import 'package:egreenbin/app/data/models/teacher.dart';
import 'package:egreenbin/app/data/repositories/student_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/services/firebase_service.dart';
import '../../data/services/sort_service.dart';
import '../../routes/app_routes.dart';
import 'package:egreenbin/app/data/repositories/comment_repository.dart';

class HomeController extends GetxController {
  // data models
  Rx<Teacher> teacher = Teacher(
    id: '20521000',
    name: "Hoàng Thì Linh",
  ).obs;
  // repository student
  final repoStudent = StudentRepository();
  final repoComment = CommentRepository();
  // class value
  RxInt numberOfStudent = 0.obs;
  // sort box
  Rx<SortService>? sortService;

  HomeController() {
    sortService = SortService(
      updateSort: fnull,
    ).obs;
  }

  @override
  void onInit() async {
    // get data
    await refreshData();
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
  Future refreshData() async {
    try {
      // loading
      isLoading.value = true;
      // fetch student
      DataCenter.instance.students.value = await repoStudent.fetchStudents();
      // fetch comments
      await repoComment.fetchComments();
      // get length of student
      numberOfStudent.value = DataCenter.instance.students.length;
      // loading off
      isLoading.value = false;
    } catch (error) {
      print("Error when fetch data: $error");
      showSnackBarAndNotification(
        "Error",
        "Error when fetch data: $error",
        AppColors.wrong,
      );
    }
  }

  // fuction of sort
  void filterByAll() {}
  void filterByDate() {}
  void filterByYear() {}
  void filterByMonth() {}

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
      await repoStudent.addStudent(newStudent);
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
