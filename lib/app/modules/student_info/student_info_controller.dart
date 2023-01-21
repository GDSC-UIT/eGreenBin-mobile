import 'package:egreenbin/app/data/models/comments.dart';
import 'package:egreenbin/app/data/models/date_sort.dart';
import 'package:egreenbin/app/data/models/student.dart';
import 'package:egreenbin/app/data/models/students.dart';
import 'package:egreenbin/app/data/services/sort_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/comment.dart';
import '../../routes/app_routes.dart';

class StudentInfoController extends GetxController {
  StudentInfoController() {
    sortCardStatical = SortService(
      filterAll: filterByAll,
      filterDate: filterByDate,
      filterWeek: filterByWeek,
      filterMonth: filterByMonth,
    ).obs;
    sortCardRatio = SortService(
      filterAll: filterByAll,
      filterDate: filterByDate,
      filterWeek: filterByWeek,
      filterMonth: filterByMonth,
    ).obs;
    sortCardEvaluate = SortService(
      filterAll: filterByAll,
      filterDate: filterByDate,
      filterWeek: filterByWeek,
      filterMonth: filterByMonth,
    ).obs;
    sortDialog = SortService(
      filterAll: filterByAll,
      filterDate: filterByDate,
      filterWeek: filterByWeek,
      filterMonth: filterByMonth,
    ).obs;
  }

  // data models
  Rx<Student> student = Student(name: "default").obs;
  // comment
  List<Comment> listComments = [];

  // textController comment
  final TextEditingController textCotroller = TextEditingController();

  // get id from prev screen
  dynamic id = Get.arguments;

  @override
  void onInit() {
    // get student and comments from id
    student.value = Students.findStudent(id);
    listComments = Comments.listCommentsFindById(id);
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

  void filterByAll() {}
  void filterByDate() {}
  void filterByWeek() {}
  void filterByMonth() {}

  void saveComment() {
    // luu comment
    String content = textCotroller.text;
    // luu sort date
    DateSort? sortTemp;
    if (sortCardRatio!.value.selectedSortBy.value ==
        SortService.sortByItems[1]) {
      sortTemp = DateSort.fromDate(date: sortCardRatio!.value.selectDate.value);
    } else if (sortCardRatio!.value.selectedSortBy.value ==
        SortService.sortByItems[2]) {
      sortTemp =
          DateSort.fromWeek(week: sortCardRatio!.value.selectedWeekSort.value);
    } else {
      sortTemp = DateSort.fromMonth(
          month: sortCardRatio!.value.selectedMonthSort.value);
    }
    // create comment
    Comment newComment = Comment(
      idStudent: student.value.id!,
      content: content,
      dateCreate: DateTime.now(),
      dateSort: sortTemp,
    );
    Comments.addComment(newComment);
    listComments = Comments.listCommentsFindById(id);
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
// dialog
//========================================================================
  Rx<SortService>? sortDialog;
}
