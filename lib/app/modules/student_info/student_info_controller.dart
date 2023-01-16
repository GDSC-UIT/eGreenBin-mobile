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

    selectedSortCardRatio = sortItems[0].obs;
    selectedWeekSortCardRatio = sortWeekItems[0].obs;
    selectedMonthSortCardRatio = sortMonthItems[0].obs;

    selectedSortCardEvaluate = sortItems[0].obs;
    selectedWeekSortCardEvaluate = sortWeekItems[0].obs;
    selectedMonthSortCardEvaluate = sortMonthItems[0].obs;
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

// data sort
//========================================================================
  static List<String> sortItems = <String>[
    'Ngày',
    'Tuần',
    'Tháng',
  ];
  static List<String> sortMonthItems = <String>[
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
  static List<String> sortWeekItems = <String>[
    'Tuần 1',
    'Tuần 2',
    'Tuần 3',
    'Tuần 4',
    'Tuần 5',
    'Tuần 6',
    'Tuần 7',
  ];
// card statical
//========================================================================
  // dropdown month
  RxString selectedMonthSortCardStatistical = ''.obs;

  final List<DropdownMenuItem<String>> monthMenuItems = sortMonthItems
      .map(
        (value) => DropdownMenuItem(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
  // function
  void changeMonthItemCardStatistical(String newValue) {
    selectedMonthSortCardStatistical.value = newValue;
  }

// card ratio
//========================================================================
  // dropdown sort
  RxString selectedSortCardRatio = ''.obs;

  void changeSortItemCardRatio(String newValue) {
    selectedSortCardRatio.value = newValue;
  }

  // datepicker
  Rx<DateTime?> selectDateCardRatio = DateTime.now().obs;

  void changeDateCardRatio(DateTime newDate) {
    selectDateCardRatio.value = newDate;
  }

  // sort theo tuan
  RxString selectedWeekSortCardRatio = ''.obs;

  void changeSortWeekItemCardRatio(String newValue) {
    selectedWeekSortCardRatio.value = newValue;
  }

  // sort theo thang
  RxString selectedMonthSortCardRatio = ''.obs;

  void changeMonthItemCardRatio(String newValue) {
    selectedMonthSortCardRatio.value = newValue;
  }

// card evaluate
//========================================================================
  // dropdown sort
  RxString selectedSortCardEvaluate = ''.obs;

  void changeSortItemCardEvaluate(String newValue) {
    selectedSortCardEvaluate.value = newValue;
  }

  // datepicker
  Rx<DateTime?> selectDateCardEvaluate = DateTime.now().obs;

  void changeDateCardEvaluate(DateTime newDate) {
    selectDateCardEvaluate.value = newDate;
  }

  // sort theo tuan
  RxString selectedWeekSortCardEvaluate = ''.obs;

  void changeSortWeekItemCardEvaluate(String newValue) {
    selectedWeekSortCardEvaluate.value = newValue;
  }

  // sort theo thang
  RxString selectedMonthSortCardEvaluate = ''.obs;

  void changeMonthItemCardEvaluate(String newValue) {
    selectedMonthSortCardEvaluate.value = newValue;
  }
}
