import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SortService extends GetxController {
  Function filterDate;
  Function filterWeek;
  Function filterMonth;
  Function filterAll;
  SortService({
    required this.filterAll,
    required this.filterDate,
    required this.filterWeek,
    required this.filterMonth,
  }) {
    selectedClass.value = sortClassItems[0];
    // sortby
    selectedSortBy.value = sortByItems[0];
    selectedSortByWithoutAll.value = sortByItems[1];
    // week
    selectedWeekSort.value = sortWeekItems[0];
    selectedWeekSortWithoutAll.value = sortWeekItems[1];
    // month
    selectedMonthSort.value = sortMonthItems[0];
    selectedMonthSortWithoutAll.value = sortMonthItems[1];
    // sortBy
    dropdownSortByItemsWithoutAll = [...dropdownSortByItems];
    dropdownSortByItemsWithoutAll.removeAt(0);
    // week
    dropdownSortWeekItemsWithoutAll = [...dropdownSortWeekItems];
    dropdownSortWeekItemsWithoutAll.removeAt(0);
    // month
    dropdownSortMonthItemsWithoutAll = [...dropdownSortMonthItems];
    dropdownSortMonthItemsWithoutAll.removeAt(0);
  }

  // data sort
//========================================================================
  static List<String> sortClassItems = <String>[
    'Seed C1',
    'Seed C2',
    'Seed C3',
  ];
  static List<String> sortByItems = <String>[
    'All'.tr,
    'Date'.tr,
    'Week'.tr,
    'Month'.tr,
  ];
  static List<String> sortMonthItems = <String>[
    'All'.tr,
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  static List<String> sortWeekItems = <String>[
    'All'.tr,
    'Week 1',
    'Week 2',
    'Week 3',
    'Week 4',
    'Week 5',
    'Week 6',
    'Week 7',
    'Week 8',
    'Week 9',
    'Week 10',
  ];
  // dropdown class
  RxString selectedClass = ''.obs;

  void changeClassItem(String newValue) {
    selectedClass.value = newValue;
  }

  final List<DropdownMenuItem<String>> dropdownClassItems = sortClassItems
      .map(
        (value) => DropdownMenuItem(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
  // dropdown sortBy
  RxString selectedSortBy = ''.obs;

  void changeSortByItem(String newValue) {
    selectedSortBy.value = newValue;
    if (selectedSortBy.value == sortByItems[0]) {
      filterAll();
    } else if (selectedSortBy.value == sortByItems[1]) {
      filterDate();
    } else if (selectedSortBy.value == sortByItems[2]) {
      filterWeek();
    } else {
      filterMonth();
    }
  }

  final List<DropdownMenuItem<String>> dropdownSortByItems = sortByItems
      .map(
        (value) => DropdownMenuItem(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  // dropdown sortBy without all
  RxString selectedSortByWithoutAll = ''.obs;

  void changeSortByItemWithoutAll(String newValue) {
    selectedSortByWithoutAll.value = newValue;
  }

  List<DropdownMenuItem<String>> dropdownSortByItemsWithoutAll = [];

  // datepicker
  Rx<DateTime?> selectDate = DateTime.now().obs;

  void changeDate(DateTime newDate) {
    selectDate.value = newDate;
  }

  // sort theo tuan
  RxString selectedWeekSort = ''.obs;

  void changeSortWeekItem(String newValue) {
    selectedWeekSort.value = newValue;
  }

  final List<DropdownMenuItem<String>> dropdownSortWeekItems = sortWeekItems
      .map(
        (value) => DropdownMenuItem(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
  // sort by week without all
  RxString selectedWeekSortWithoutAll = ''.obs;

  void changeSortWeekItemWithoutAll(String newValue) {
    selectedWeekSortWithoutAll.value = newValue;
  }

  List<DropdownMenuItem<String>> dropdownSortWeekItemsWithoutAll = [];
  // sort by month
  RxString selectedMonthSort = ''.obs;

  void changeSortMonthItem(String newValue) {
    selectedMonthSort.value = newValue;
  }

  final List<DropdownMenuItem<String>> dropdownSortMonthItems = sortMonthItems
      .map(
        (value) => DropdownMenuItem(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
  // sort by month without all
  RxString selectedMonthSortWithoutAll = ''.obs;

  void changeSortMonthItemWithoutAll(String newValue) {
    selectedMonthSortWithoutAll.value = newValue;
  }

  List<DropdownMenuItem<String>> dropdownSortMonthItemsWithoutAll = [];
}
