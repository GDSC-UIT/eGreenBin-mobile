import 'package:egreenbin/app/data/models/students.dart';
import 'package:egreenbin/app/data/models/teacher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/services/sort_service.dart';

class HomeController extends GetxController {
  HomeController() {
    sortService = SortService().obs;
    numberOfStudent = listStudent.value.listStudents.length.obs;
  }

  // function
  void pushToMailScreen() {}
  void refresh() {}

  // data models
  Rx<Students> listStudent = Students().obs;

  Rx<Teacher> teacher = Teacher(
    name: "Hoàng Thì Linh",
    mgv: '20521000',
  ).obs;

  // class value
  RxInt numberOfStudent = 32.obs;
  // sort box
  Rx<SortService>? sortService;
}
