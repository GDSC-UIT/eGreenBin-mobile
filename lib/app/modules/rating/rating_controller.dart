import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/comment.dart';
import '../../data/models/date_sort.dart';
import '../../data/providers/comments.dart';
import '../../data/models/student.dart';
import '../../data/providers/students.dart';
import '../../data/services/sort_service.dart';

class RatingController extends GetxController {
  RatingController() {
    sortService = SortService(
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

  // data student
  Rx<Student> student = Student(name: "default").obs;

  dynamic id = Get.arguments;

  @override
  void onInit() {
    student.value = Students.findStudent(id);
    listComments.value = Comments.listCommentsFindById(id);
    super.onInit();
  }

  // delete a comment
  void deleteComment(Comment comment) {
    Comments.deleteComment(comment);
    listComments.remove(comment);
  }

  // comment
  RxList<Comment> listComments = <Comment>[].obs;
  // dropButton sort value
  Rx<SortService>? sortService;
  // dialog
  Rx<SortService>? sortDialog;
  // textController comment
  final TextEditingController textCotroller = TextEditingController();

  // fuction
  Function fnull = () {};

  void backToPrevScreen() {
    Get.back();
  }

  void filterByAll() {
    // update list comment by date
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

  // save comment to listcomment
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
}
