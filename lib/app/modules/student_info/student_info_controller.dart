import 'package:egreenbin/app/data/models/comments.dart';
import 'package:egreenbin/app/data/models/student.dart';
import 'package:egreenbin/app/data/models/students.dart';
import 'package:egreenbin/app/data/services/sort_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/comment.dart';
import '../../routes/app_routes.dart';

class StudentInfoController extends GetxController {
  StudentInfoController() {
    sortCardStatical = SortService().obs;
    sortCardRatio = SortService().obs;
    sortCardEvaluate = SortService().obs;
  }

  // data models
  Students listStudent = Students();
  Rx<Student> student = Student(name: "default").obs;
  // comment
  Comments allcomments = Comments();
  List<Comment> listComments = [];

  // textController comment
  final TextEditingController textCotroller = TextEditingController();

  // get id from prev screen
  dynamic id = Get.arguments;

  @override
  void onInit() {
    // get student and comments from id
    student.value = listStudent.findStudent(id);
    listComments = allcomments.listCommentsFindById(id);
    super.onInit();
  }

  @override
  void onClose() {
    textCotroller.dispose();
    super.onClose();
  }

  // function
  void backToPrevScreen() {
    Get.back();
  }

  void pushToAllCommentScreen() {
    if (listComments.isEmpty) return;
    Get.toNamed(AppRoutes.rating, arguments: student.value.id);
  }

  void saveComment() {
    // luu comment
    String content = textCotroller.text;
    Comment newComment = Comment(
      idStudent: student.value.id!,
      content: content,
      date: DateTime.now(),
    );

    allcomments.addComment(newComment);
    listComments = allcomments.listCommentsFindById(id);
    update();
    textCotroller.clear();
  }

// card statical
//========================================================================
  Rx<SortService>? sortCardStatical;

// card ratio
//========================================================================
  Rx<SortService>? sortCardRatio;
// card evaluate
//========================================================================
  Rx<SortService>? sortCardEvaluate;
}
