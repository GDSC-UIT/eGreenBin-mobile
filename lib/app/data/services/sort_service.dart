import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SortService extends GetxController {
  Function updateSort;
  SortService({
    required this.updateSort,
  }) {
    selectedClass.value = sortClassItems[0];
    // sortby
    selectedSortBy.value = sortByItems[0];
    selectedSortByWithoutAll.value = sortByItems[1];
    // sortBy
    dropdownSortByItemsWithoutAll = [...dropdownSortByItems];
    dropdownSortByItemsWithoutAll.removeAt(0);
    // month
    selectedMonthSort.value = sortMonthItems[0];
    // year
    selectedYearSort.value = sortYearItems[0];
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
    'Month'.tr,
    'Year'.tr,
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

  static List<int> sortYearItems = <int>[
    2023,
    2022,
    2021,
    2020,
    2019,
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

  // change data when choose type of sort
  void changeSortByItem(String newValue) {
    selectedSortBy.value = newValue;
    updateSort();
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

  // sort by Date
  // datepicker
  Rx<DateTime?> selectDate = DateTime.now().obs;

  void changeDate(DateTime newDate) {
    selectDate.value = newDate;
  }

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

  // sort theo tuan
  RxInt selectedYearSort = 0.obs;

  void changeSortYearItem(int newValue) {
    selectedYearSort.value = newValue;
  }

  final List<DropdownMenuItem<int>> dropdownSortYearItems = sortYearItems
      .map(
        (value) => DropdownMenuItem(
          value: value,
          child: Text(value.toString()),
        ),
      )
      .toList();
}
