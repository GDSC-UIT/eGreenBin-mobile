import 'package:egreenbin/app/data/models/mail.dart';
import 'package:egreenbin/app/data/models/student.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import '../../data/providers/students.dart';
import '../../data/models/teacher.dart';
import '../../data/services/firebase_service.dart';
import '../../data/services/sort_service.dart';

class MailController extends GetxController {
  MailController() {
    sortService = SortService(
      filterAll: fnull,
      filterDate: fnull,
      filterWeek: fnull,
      filterMonth: fnull,
    ).obs;
    numberOfStudent = Students.listStudents.length.obs;
    testMail = Mail(student: Students.listStudents[0], content: "");
  }

  // function
  Function fnull = () {};

  void popToPrevScreen() {
    Get.back();
  }

  Future sendMailToAll() async {
    if (image != null) {
      // chup man hinh va luu lai
      //await LocalService.saveImage(image!);
      // luu man hinh len firebase
      String urlImage = await FireBaseService.uploadImage(image);
      //print(urlImage);
      // lay link roi bo vao mail
      testMail!.setImageUrl(urlImage);
    }
    // send email to all parents
    await testMail!.sendEmail();
  }

  Future saveNote(Student student) async {
    // luu content
    String note = textCotroller.text;
    if (note == "") {
      student.isNote = false;
    } else {
      student.isNote = true;
    }
    // lay link roi bo vao mail
    testMail = Mail(student: student, content: note);
  }

  void filterByAll() {}
  void filterByDate() {}
  void filterByWeek() {}
  void filterByMonth() {}

  @override
  void onInit() {
    // argument
    teacher.value = Get.arguments;
    super.onInit();
  }

  // image
  Uint8List? image;
  // screen shot
  final screenshotController = ScreenshotController();
  // mail
  Mail? testMail;
  // sort box
  Rx<SortService>? sortService;
  // data models

  Rx<Teacher> teacher = Teacher(
    id: '20521000',
    name: "Hoàng Thì Linh",
  ).obs;
  // class value
  RxInt numberOfStudent = 32.obs;
  // textController comment
  final TextEditingController textCotroller = TextEditingController();
}
