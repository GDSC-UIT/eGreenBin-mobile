import 'package:egreenbin/app/data/models/student.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/students.dart';
import '../../data/models/teacher.dart';
import '../../data/services/sort_service.dart';

class MailController extends GetxController {
  MailController() {
    sortService = SortService().obs;
    numberOfStudent = listStudent.value.listStudents.length.obs;
  }

  // function
  void popToPrevScreen() {
    Get.back();
  }

  void sendMailToAll() {
    // send email to all parents
  }

  void saveNote(Student student) {
    student.isNote = true;
    String note = textCotroller.text;
    textCotroller.clear();
  }

  void deleteNote(Student student) {
    student.isNote = false;
  }

  // sort box
  Rx<SortService>? sortService;
  // data models
  Rx<Students> listStudent = Students().obs;

  Rx<Teacher> teacher = Teacher(
    id: '20521000',
    name: "Hoàng Thì Linh",
  ).obs;

  // class value
  RxInt numberOfStudent = 32.obs;
  // textController comment
  final TextEditingController textCotroller = TextEditingController();
}
