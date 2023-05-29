import 'package:egreenbin/app/data/models/date_sort.dart';
import 'package:egreenbin/app/data/models/garbage.dart';
import 'package:egreenbin/app/data/models/result_cell.dart';
import 'package:egreenbin/app/data/models/student.dart';
import 'package:egreenbin/app/data/repositories/comment_repository.dart';
import 'package:egreenbin/app/data/repositories/garbage_repository.dart';
import 'package:egreenbin/app/data/repositories/result_cell_repository.dart';
import 'package:egreenbin/app/data/services/sort_service.dart';
import 'package:egreenbin/app/modules/student_info/screens/rating_screen.dart';
import 'package:egreenbin/app/modules/student_info/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/comment.dart';
import '../../data/repositories/student_repository.dart';

class StudentInfoController extends GetxController {
  // repository
  final repoStudent = StudentRepository();
  final repoComment = CommentRepository();
  final repoGarbage = GarbageRepository();
  final repoResultCell = ResultCellRepository();
  // this function will do nothing
  Function fnull = () {};
  // data models
  Rx<Student> student = Student(name: "default").obs;
  // comment
  RxList<Comment> listComments = <Comment>[].obs;
  // garbages
  RxList<Garbage> listGarbages = <Garbage>[].obs;
  // results cell
  RxList<ResultCell> listResultCell = <ResultCell>[].obs;
  // get id from prev screen
  dynamic id = Get.arguments;
  // textController comment
  final TextEditingController textCotroller = TextEditingController();

  // number of Right and Wrong
  RxInt numOfRight = 0.obs;
  RxInt numOfWrong = 0.obs;
  // card statical
  Rx<SortService>? sortCardStatical;
  // card ratio
  Rx<SortService>? sortCardRatio;
  // card evaluate
  Rx<SortService>? sortCardEvaluate;
  // dialog
  Rx<SortService>? sortDialog;
  // card sort result
  Rx<SortService>? sortResult;
  //==========================

  StudentInfoController() {
    sortCardStatical = SortService(
      updateSort: fnull,
    ).obs;
    sortCardRatio = SortService(
      updateSort: fnull,
    ).obs;
    sortCardEvaluate = SortService(
      updateSort: updateCurrentListComment,
    ).obs;
    sortDialog = SortService(
      updateSort: fnull,
    ).obs;
    sortResult = SortService(
      updateSort: fnull,
    ).obs;
  }

  @override
  void onInit() async {
    // get student and comments from id
    student.value = repoStudent.findStudentById(id);
    listComments.value = repoComment.getListCommentsFindByIdStudentLocal(id);
    // get list garbage of student
    listGarbages.value = repoGarbage.getGabagesOfStudentLocal(id);
    repoResultCell.getAllResultCell();
    listResultCell.value = repoResultCell.getResultCellsById(id);
    // get Number of right and wrong
    numOfRight.value = student.value.numOfCorrect!;
    numOfWrong.value = student.value.numOfWrong!;
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

  void navigateToResultScreen() {
    Get.to(() => ResultScreen());
  }

  // this fuction is push to rating module
  void pushToAllCommentScreen() {
    // isPop is check is screen is pop from rating screen
    var isPop = Get.to(() => RatingScreen(), arguments: student.value.id);

    // ignore: unrelated_type_equality_checks
    if (isPop == 'success') {
      // do something
    }
  }

  // this function if pop from rating screen
  void backToStudentInfo() {
    Get.back(result: 'success');
  }

// comment ================================================================
  void saveComment() async {
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
    await repoComment.addComment(newComment);
    // bug
    updateCurrentListComment();
    // clear textcontroller
    textCotroller.clear();
  }

  // delete a comment
  void deleteComment(Comment comment) {
    repoComment.deleteComment(comment);
    listComments.remove(comment);
  }

  //get type of sort when add comment from dialog
  DateSort getDateSortFromDialog() {
    String typeSort = sortDialog!.value.selectedSortByWithoutAll.value;
    if (typeSort == SortService.sortByItems[1]) {
      return DateSort.fromDate(date: sortDialog!.value.selectDate.value!);
    } else if (typeSort == SortService.sortByItems[2]) {
      return DateSort.fromMonth(
          month: sortDialog!.value.selectedMonthSort.value);
    } else {
      return DateSort.fromYear(year: sortDialog!.value.selectedYearSort.value);
    }
  }

// filter comment==========================================
  Future<void> filterByAll() async {
    // update list comment by all
    listComments.value = repoComment.getListCommentsFindByIdStudentLocal(id);
  }

  Future<void> filterByDate() async {
    // update list comment by date
    listComments.value = repoComment.getListCommentsSortByDate(id);
  }

  Future<void> filterByYear() async {
    // update list comment by year
    listComments.value = repoComment.getListCommentsSortByMonth(id);
  }

  Future<void> filterByMonth() async {
    // update list comment by month
    listComments.value = repoComment.getListCommentsSortByYear(id);
  }

  // update list comment when change comment
  void updateCurrentListComment() {
    String typeSort = sortCardEvaluate!.value.selectedSortBy.value;
    if (typeSort == SortService.sortByItems[0]) {
      filterByAll();
    } else if (typeSort == SortService.sortByItems[1]) {
      filterByDate();
    } else if (typeSort == SortService.sortByItems[2]) {
      filterByMonth();
    } else {
      filterByYear();
    }
  }

// Garbages ===================================================================
  List<Garbage> garbagesMonth = [];

  // get list garbage month
  void listGarbagesMonth(int month) {
    garbagesMonth = repoGarbage.getGabagesEachMonth(listGarbages, month);
  }

  // get num of garbages by week
  int numOfCorrectByWeek(int week) {
    return repoGarbage.getNumOfCorrectByWeek(garbagesMonth, week);
  }

  int numOfWrongByWeek(int week) {
    return repoGarbage.getNumOfWrongByWeek(garbagesMonth, week);
  }

// filter garbages ============================================================
}
