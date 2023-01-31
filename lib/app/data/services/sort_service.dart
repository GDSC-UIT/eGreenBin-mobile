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
    selectedSortBy.value = sortByItems[0];
    selectedSortByWithoutAll.value = sortByItems[1];
    selectedWeekSort.value = sortWeekItems[0];
    selectedMonthSort.value = sortMonthItems[0];
    dropdownSortByItemsWithoutAll = [...dropdownSortByItems];
    dropdownSortByItemsWithoutAll.removeAt(0);
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
  // sort theo thang
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
}
