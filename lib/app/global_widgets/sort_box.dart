import 'package:egreenbin/app/data/services/sort_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../core/values/app_colors.dart';
import '../core/values/app_values.dart';
import '../core/values/assets_image.dart';
import '../core/values/text_styles.dart';

// ignore: must_be_immutable
class SortBox extends StatelessWidget {
  // text title
  String textTitle;
  // sort service
  SortService sortService;
  // is this sortbox in dialog
  bool isInDialog = false;

  SortBox({
    super.key,
    required this.textTitle,
    required this.sortService,
    this.isInDialog = false,
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
        sortService.changeDate(pickedDate);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
// sort all
    Widget showAll = Container(width: 80);
// calenda
    Widget showCalendar = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 80,
          child: Obx(() => Text(
                sortService.selectDate.value == null
                    ? '01/01/2023'
                    : DateFormat(FormatValue.numbericDateFormat)
                        .format(sortService.selectDate.value as DateTime),
                style: CustomTextStyle.b3(AppColors.normal),
              )),
        ),
        GestureDetector(
          onTap: () => _presentDatePicker(context),
          child: SizedBox(
            height: 20,
            width: 20,
            child: Image.asset(
              Assets.calendar,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ],
    );
// sort Week
    Widget showListWeek = Obx(
      () => DropdownButton<String>(
        menuMaxHeight: 200,
        style: CustomTextStyle.b3(AppColors.normal),
        dropdownColor: AppColors.primarySubtle2,
        value: sortService.selectedWeekSort.value,
        // thay doi item
        onChanged: (String? newValue) {
          sortService.changeSortWeekItem(newValue!);
        },
        items: sortService.dropdownSortWeekItems,
        underline: Container(color: AppColors.surface),
        icon: const Icon(
          Icons.expand_more,
          size: 18,
          color: AppColors.normal,
        ),
      ),
    );
// sort Month
    Widget showListMonth = Obx(
      () => DropdownButton<String>(
        menuMaxHeight: 200,
        style: CustomTextStyle.b3(AppColors.normal),
        dropdownColor: AppColors.primarySubtle2,
        value: sortService.selectedMonthSort.value,
        // thay doi item
        onChanged: (String? newValue) {
          sortService.changeSortMonthItem(newValue!);
        },
        items: sortService.dropdownSortMonthItems,
        underline: Container(color: AppColors.surface),
        icon: const Icon(
          Icons.expand_more,
          size: 18,
          color: AppColors.normal,
        ),
      ),
    );

// built UI
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textTitle,
          style: CustomTextStyle.b2(AppColors.subtle_1),
        ),
        const SizedBox(height: 7),
        Container(
          width: 200,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primarySubtle2,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: AppColors.primary1,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // lua chon ngay, thang, nam
              Obx(
                () => DropdownButton<String>(
                  style: CustomTextStyle.b3(AppColors.normal),
                  dropdownColor: AppColors.primarySubtle2,
                  value: isInDialog
                      ? sortService.selectedSortByWithoutAll.value
                      : sortService.selectedSortBy.value,
// thay doi item
                  onChanged: (String? newValue) {
                    if (isInDialog) {
                      sortService.changeSortByItemWithoutAll(newValue!);
                    } else {
                      sortService.changeSortByItem(newValue!);
                    }
                  },

                  items: isInDialog
                      ? sortService.dropdownSortByItemsWithoutAll
                      : sortService.dropdownSortByItems,
                  underline: Container(color: AppColors.surface),
                  icon: const Icon(
                    Icons.expand_more,
                    size: 18,
                    color: AppColors.normal,
                  ),
                ),
              ),
              // divider
              Obx(
                () => (sortService.selectedSortBy.value !=
                            SortService.sortByItems[0] ||
                        isInDialog)
                    ? const VerticalDivider(
                        color: AppColors.primary1,
                        thickness: 1,
                      )
                    : const SizedBox(width: 0),
              ),
// if sort by day => calendar
// if sort by week => listWeekDrop
// if sort by month => listMonthDrop
// none => show all
              isInDialog
                  ? Obx(() => (sortService.selectedSortByWithoutAll.value ==
                          SortService.sortByItems[1])
                      ? showCalendar
                      : (sortService.selectedSortByWithoutAll.value ==
                              SortService.sortByItems[2])
                          ? showListWeek
                          : showListMonth)
                  : Obx(
                      () => (sortService.selectedSortBy.value ==
                              SortService.sortByItems[1])
                          ? showCalendar
                          : (sortService.selectedSortBy.value ==
                                  SortService.sortByItems[2])
                              ? showListWeek
                              : (sortService.selectedSortBy.value ==
                                      SortService.sortByItems[3])
                                  ? showListMonth
                                  : showAll,
                    ),
            ],
          ),
        )
      ],
    );
  }
}
