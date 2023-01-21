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
    'Mầm C1',
    'Mầm C2',
    'Mầm C3',
  ];
  static List<String> sortByItems = <String>[
    'Tất cả',
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
