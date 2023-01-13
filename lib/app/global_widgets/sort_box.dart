import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/values/app_colors.dart';
import '../core/values/app_values.dart';
import '../core/values/assets_image.dart';
import '../core/values/text_styles.dart';

class SortBox extends StatelessWidget {
  // dropdown sort
  List<String> sortItems;
  String selectedSort;
  Function changeSortItem;
  // datepicker
  DateTime? selectDate;
  Function changeDate;
  // dropdown sort week
  List<String> sortWeekItems;
  String selectedWeekSort;
  Function changeSortWeekItem;
  // dropdown sort month
  List<String> sortMonthItems;
  String selectedMonthSort;
  Function changeSortMonthItem;

  SortBox({
    required this.sortItems,
    required this.selectedSort,
    required this.changeSortItem,
    required this.selectDate,
    required this.changeDate,
    required this.sortWeekItems,
    required this.selectedWeekSort,
    required this.changeSortWeekItem,
    required this.sortMonthItems,
    required this.selectedMonthSort,
    required this.changeSortMonthItem,
  });
  // show date picker
  void _presentDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) return;
        changeDate(pickedDate);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
// sort ngay, thang, tuan
    final List<DropdownMenuItem<String>> _sortMenuItems = sortItems
        .map(
          (value) => DropdownMenuItem(
            value: value,
            child: Text(value),
          ),
        )
        .toList();
// sort theo week
    final List<DropdownMenuItem<String>> _sortWeekItems = sortWeekItems
        .map(
          (value) => DropdownMenuItem(
            value: value,
            child: Text(value),
          ),
        )
        .toList();
// sort theo thang
    final List<DropdownMenuItem<String>> _sortMonthItems = sortMonthItems
        .map(
          (value) => DropdownMenuItem(
            value: value,
            child: Text(value),
          ),
        )
        .toList();
// calenda
    Widget showCalendar = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 80,
          child: Text(
            selectDate == null
                ? '01/01/2023'
                : '${DateFormat(FormatValue.numbericDateFormat).format(selectDate! as DateTime)}',
            style: CustomTextStyle.b3(AppColors.Normal),
          ),
        ),
        //const SizedBox(width: 5),
        GestureDetector(
          onTap: () => _presentDatePicker(context),
          child: Container(
            height: 18,
            width: 20,
            child: Image.asset(Assets.calendar),
          ),
        )
      ],
    );
// sort Week
    Widget showListWeek = DropdownButton<String>(
      menuMaxHeight: 200,
      style: CustomTextStyle.b3(AppColors.Normal),
      dropdownColor: AppColors.PrimarySubtle2,
      value: selectedWeekSort,
      // thay doi item
      onChanged: (String? newValue) {
        changeSortWeekItem(newValue!);
      },
      items: _sortWeekItems,
      underline: Container(color: AppColors.Surface),
      icon: const Icon(
        Icons.expand_more,
        size: 18,
        color: AppColors.Normal,
      ),
    );
// sort Month
    Widget showListMonth = DropdownButton<String>(
      menuMaxHeight: 200,
      style: CustomTextStyle.b3(AppColors.Normal),
      dropdownColor: AppColors.PrimarySubtle2,
      value: selectedMonthSort,
      // thay doi item
      onChanged: (String? newValue) {
        changeSortMonthItem(newValue!);
      },
      items: _sortMonthItems,
      underline: Container(color: AppColors.Surface),
      icon: const Icon(
        Icons.expand_more,
        size: 18,
        color: AppColors.Normal,
      ),
    );

// built UI
    return Row(
      children: [
        const SizedBox(width: 21),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lọc theo",
              style: CustomTextStyle.b2(AppColors.Subtle_1),
            ),
            const SizedBox(height: 5),
            Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.PrimarySubtle2,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: AppColors.Primary1,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // lua chon ngay, thang, nam
                  DropdownButton<String>(
                    style: CustomTextStyle.b3(AppColors.Normal),
                    dropdownColor: AppColors.PrimarySubtle2,
                    value: selectedSort,
                    // thay doi item
                    onChanged: (String? newValue) {
                      changeSortItem(newValue!);
                    },
                    items: _sortMenuItems,
                    underline: Container(color: AppColors.Surface),
                    icon: const Icon(
                      Icons.expand_more,
                      size: 18,
                      color: AppColors.Normal,
                    ),
                  ),
                  // divider
                  const VerticalDivider(
                    color: AppColors.Primary1,
                    thickness: 1,
                  ),
// if sort by day => calendar
// if sort by week => listWeekDrop
// if sort by month => listMonthDrop
                  (selectedSort == "Ngày")
                      ? showCalendar
                      : (selectedSort == "Tuần")
                          ? showListWeek
                          : showListMonth,
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
