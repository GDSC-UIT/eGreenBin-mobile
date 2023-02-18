import 'package:egreenbin/app/data/providers/comments.dart';
import 'package:egreenbin/app/data/models/date_sort.dart';
import 'package:egreenbin/app/data/models/student.dart';
import 'package:egreenbin/app/data/providers/garbages.dart';
import 'package:egreenbin/app/data/providers/students.dart';
import 'package:egreenbin/app/data/services/sort_service.dart';
import 'package:egreenbin/app/modules/student_info/screens/rating_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/comment.dart';

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

  // this function will do nothing
  Function fnull = () {};
  // data models
  Rx<Student> student = Student(name: "default").obs;
  // comment
  RxList<Comment> listComments = <Comment>[].obs;

  // textController comment
  final TextEditingController textCotroller = TextEditingController();

  // number of Right and Wrong
  RxInt numOfRight = 0.obs;
  RxInt numOfWrong = 0.obs;
  //==========================

  // get id from prev screen
  dynamic id = Get.arguments;

  @override
  void onInit() {
    // get student and comments from id
    student.value = Students.findStudent(id);
    listComments.value = Comments.listCommentsFindById(id);
    // get Number of right and wrong
    numOfRight.value = Garbages.getNumOfCorrect(id);
    numOfWrong.value = Garbages.getNumOfWrong(id);
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
    var isPop = Get.to(() => RatingScreen(), arguments: student.value.id);

    // ignore: unrelated_type_equality_checks
    if (isPop == 'success') {
      refreshComment();
    }
  }

  // this function if pop from rating screen
  void backToStudentInfo() {
    Get.back(result: 'success');
  }

  // refresh comment
  void refreshComment() {
    print("pop sreen yearrrrrrrrrrrrrrrrrrrrrrr");
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

  // update list comment when change comment
  void updateCurrentListComment() {
    String typeSort = sortCardEvaluate!.value.selectedSortBy.value;
    if (typeSort == SortService.sortByItems[0]) {
      filterByAll();
    } else if (typeSort == SortService.sortByItems[1]) {
      filterByDate();
    } else if (typeSort == SortService.sortByItems[2]) {
      filterByWeek();
    } else {
      filterByMonth();
    }
  }

// comment ================================================================
  void saveComment() {
    // luu comment
    String content = textCotroller.text;
    // luu sort date
    DateSort? sortTemp;
    sortTemp = getDateSortFromDialog();
    // create comment
    Comment newComment = Comment(
      idStudent: student.value.id!,
      content: content,
      dateCreate: DateTime.now(),
      dateSort: sortTemp,
    );
    // add this comment to list comment
    Comments.addComment(newComment);
    // bug
    updateCurrentListComment();
    // clear textcontroller
    textCotroller.clear();
  }

  // delete a comment
  void deleteComment(Comment comment) {
    Comments.deleteComment(comment);
    listComments.remove(comment);
  }

  //get type of sort when add comment from dialog
  DateSort getDateSortFromDialog() {
    String typeSort = sortDialog!.value.selectedSortByWithoutAll.value;
    if (typeSort == SortService.sortByItems[1]) {
      return DateSort.fromDate(date: sortDialog!.value.selectDate.value);
    } else if (typeSort == SortService.sortByItems[2]) {
      return DateSort.fromWeek(week: sortDialog!.value.selectedWeekSort.value);
    } else {
      return DateSort.fromMonth(
          month: sortDialog!.value.selectedMonthSort.value);
    }
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
