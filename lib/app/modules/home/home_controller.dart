import 'package:egreenbin/app/data/models/students.dart';
import 'package:egreenbin/app/data/models/teacher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController() {
    selectedClass = classItems[0].obs;
    selectedSort = sortItems[0].obs;
    selectedWeekSort = sortWeekItems[0].obs;
    selectedMonthSort = sortMonthItems[0].obs;
    numberOfStudent = listStudent.value.listStudents.length.obs;
  }

  // function
  void pushToMailScreen() {}
  void refresh() {}

  // data models
  Rx<Students> listStudent = Students().obs;

  Rx<Teacher> teacher = Teacher(
    name: "Hoàng Thì Linh",
    mgv: '20521000',
  ).obs;

  // class value
  RxInt numberOfStudent = 32.obs;
  // dropdown class
  static List<String> classItems = <String>['Mầm C1', 'Mầm C2', 'Mầm C3'];
  RxString selectedClass = ''.obs;

  void changeClassItem(String newValue) {
    selectedClass.value = newValue;
  }

  final List<DropdownMenuItem<String>> classMenuItems = classItems
      .map(
        (value) => DropdownMenuItem(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
  // dropdown sort
  // dort ngay, tuan, thang
  List<String> sortItems = <String>['Ngày', 'Tuần', 'Tháng'];
  RxString selectedSort = ''.obs;

  void changeSortItem(String newValue) {
    selectedSort.value = newValue;
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
  RxString selectedMonthSort = ''.obs;

  void changeSortMonthItem(String newValue) {
    selectedMonthSort.value = newValue;
  }

  // datepicker
  Rx<DateTime?> selectDate = DateTime.now().obs;

  void changeDate(DateTime newDate) {
    selectDate.value = newDate;
  }
}
