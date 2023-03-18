import 'package:egreenbin/app/data/models/mail.dart';
import 'package:egreenbin/app/data/models/student.dart';
import 'package:egreenbin/app/data/repositories/student_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import '../../data/models/teacher.dart';
import '../../data/providers/data_center.dart';
import '../../data/services/firebase_service.dart';
import '../../data/services/sort_service.dart';

class MailController extends GetxController {
  // student reposity
  final repoStudent = StudentRepository();
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

  // function
  MailController() {
    sortService = SortService(
      updateSort: fnull,
    ).obs;
    numberOfStudent.value = DataCenter.instance.students.length;
    testMail = Mail(student: repoStudent.getStudentFromIndex(0));
  }

  @override
  void onInit() {
    // argument
    teacher.value = Get.arguments;
    super.onInit();
  }

  Function fnull = () {};

  void popToPrevScreen() {
    Get.back();
  }

  Future<void> captureScreen() async {
    image = await screenshotController.capture();
  }

  Future sendMailToAll() async {
    // chup man hinh va luu lai
    await captureScreen();

    if (image != null) {
      // luu anh vao dien thoai
      //await LocalService.saveImage(image!);
      // luu man hinh len firebase
      String urlImage = await FireBaseService.uploadImage(image);
      print(urlImage);
      // lay link roi bo vao mail
      testMail!.setImageUrl(urlImage);
    }
    // send email to all parents
    await testMail!.sendEmail();
  }

  Future saveNote(Student student) async {
    // luu content vao student
    student.note = textCotroller.text;
    // lay link roi bo vao mail
    testMail = Mail(student: student);
  }

  void filterByAll() {}
  void filterByDate() {}
  void filterByYear() {}
  void filterByMonth() {}
}
