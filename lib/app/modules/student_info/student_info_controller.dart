import 'package:egreenbin/app/data/models/comments.dart';
import 'package:egreenbin/app/data/models/student.dart';
import 'package:egreenbin/app/data/models/students.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/comment.dart';
import '../../routes/app_routes.dart';

class StudentInfoController extends GetxController {
  StudentInfoController() {
    selectedMonthSortCardStatistical = sortMonthItems[0].obs;
    selectedSort = sortItems[0].obs;
    selectedSortComment = sortCommentItems[0].obs;
    selectedMonthSortCardRatio = sortMonthItems[0].obs;
    selectedWeekSort = sortWeekItems[0].obs;
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
    //String comment = textCotroller.text;
    textCotroller.clear();
  }

  // textController comment
  final TextEditingController textCotroller = TextEditingController();
  // data student
  Students listStudent = Students();
  Rx<Student> student = Student(name: "default").obs;

  dynamic id = Get.arguments;

  @override
  void onInit() {
    student.value = listStudent.findStudent(id);
    listComments = allcomments.listCommentsFindById(id);
    super.onInit();
  }

  // dropdown sort
  List<String> sortItems = <String>['Ngày', 'Tuần', 'Tháng'];
  RxString selectedSort = ''.obs;

  void changeSortItem(String newValue) {
    selectedSort.value = newValue;
  }

  // dropButton sort value
  List<String> sortCommentItems = <String>["Mới nhất", "Cũ nhất"];
  RxString selectedSortComment = ''.obs;
  void changeSortCommentItem(String newValue) {
    selectedSortComment.value = newValue;
  }

  // datepicker
  Rx<DateTime?> selectDate = DateTime.now().obs;

  void changeDate(DateTime newDate) {
    selectDate.value = newDate;
  }

  // dropdown month
  List<String> sortMonthItems = <String>[
    'Tháng 1',
    'Tháng 2',
    'Tháng 3',
    'Tháng 4',
    'Tháng 5',
    'Tháng 6',
    'Tháng 7',
    'Tháng 8',
    'Tháng 9',
    'Tháng 10',
    'Tháng 11',
    'Tháng 12',
  ];

  RxString selectedMonthSortCardStatistical = ''.obs;

  void changeMonthItemCardStatistical(String newValue) {
    selectedMonthSortCardStatistical.value = newValue;
  }

  // sort theo tuan
  List<String> sortWeekItems = <String>[
    'Tuần 1',
    'Tuần 2',
    'Tuần 3',
    'Tuần 4',
    'Tuần 5',
    'Tuần 6',
    'Tuần 7',
  ];
  RxString selectedWeekSort = ''.obs;

  void changeSortWeekItem(String newValue) {
    selectedWeekSort.value = newValue;
  }

  // sort theo thang
  RxString selectedMonthSortCardRatio = ''.obs;

  void changeMonthItemCardRatio(String newValue) {
    selectedMonthSortCardRatio.value = newValue;
  }

  // comment
  Comments allcomments = Comments();
  List<Comment> listComments = [];
}
