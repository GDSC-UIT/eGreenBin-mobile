import 'package:egreenbin/app/data/providers/comments.dart';
import 'package:egreenbin/app/data/models/date_sort.dart';
import 'package:egreenbin/app/data/models/student.dart';
import 'package:egreenbin/app/data/providers/students.dart';
import 'package:egreenbin/app/data/services/sort_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/comment.dart';
import '../../routes/app_routes.dart';

class StudentInfoController extends GetxController {
  StudentInfoController() {
    sortCardStatical = SortService(
      filterAll: fnull,
      filterDate: fnull,
      filterWeek: fnull,
      filterMonth: fnull,
    ).obs;
    sortCardRatio = SortService(
      filterAll: fnull,
      filterDate: fnull,
      filterWeek: fnull,
      filterMonth: fnull,
    ).obs;
    sortCardEvaluate = SortService(
      filterAll: filterByAll,
      filterDate: filterByDate,
      filterWeek: filterByWeek,
      filterMonth: filterByMonth,
    ).obs;
    sortDialog = SortService(
      filterAll: fnull,
      filterDate: fnull,
      filterWeek: fnull,
      filterMonth: fnull,
    ).obs;
  }

  Function fnull = () {};
  // data models
  Rx<Student> student = Student(name: "default").obs;
  // comment
  RxList<Comment> listComments = <Comment>[].obs;

  // textController comment
  final TextEditingController textCotroller = TextEditingController();

  // get id from prev screen
  dynamic id = Get.arguments;

  @override
  void onInit() {
    // get student and comments from id
    student.value = Students.findStudent(id);
    listComments.value = Comments.listCommentsFindById(id);
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

  // this fuction is push to rating module
  void pushToAllCommentScreen() {
    // isPop is check is screen is pop from rating screen
    var isPop = Get.toNamed(AppRoutes.rating, arguments: student.value.id);

    // ignore: unrelated_type_equality_checks
    if (isPop == 'success') {
      refreshComment();
    }
  }

  // refresh comment
  void refreshComment() {
    print("pop sreenasdddddddddddddddddddddddddddddddddddd");
  }

// filter comment==========================================
  void filterByAll() {
    // update list comment by all
    listComments.value = Comments.listCommentsFindById(id);
  }

  void filterByDate() {
    // update list comment by date
    listComments.value = Comments.listCommentsSortByDate(id);
  }

  void filterByWeek() {
    // update list comment by week
    listComments.value = Comments.listCommentsSortByWeek(id);
  }

  void filterByMonth() {
    // update list comment by month
    listComments.value = Comments.listCommentsSortByMonth(id);
  }

// comment ================================================================
  void saveComment() {
    // luu comment
    String content = textCotroller.text;
    // luu sort date
    DateSort? sortTemp;
    if (sortDialog!.value.selectedSortByWithoutAll.value ==
        SortService.sortByItems[1]) {
      sortTemp = DateSort.fromDate(date: sortDialog!.value.selectDate.value);
    } else if (sortDialog!.value.selectedSortByWithoutAll.value ==
        SortService.sortByItems[2]) {
      sortTemp =
          DateSort.fromWeek(week: sortDialog!.value.selectedWeekSort.value);
    } else {
      sortTemp =
          DateSort.fromMonth(month: sortDialog!.value.selectedMonthSort.value);
    }
    // create comment
    Comment newComment = Comment(
      idStudent: student.value.id!,
      content: content,
      dateCreate: DateTime.now(),
      dateSort: sortTemp,
    );
    Comments.addComment(newComment);
    listComments.value = Comments.listCommentsFindById(id);
    textCotroller.clear();
  }

  void deleteComment(Comment comment) {
    Comments.deleteComment(comment);
    listComments.remove(comment);
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
