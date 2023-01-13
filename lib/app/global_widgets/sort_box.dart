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

  SortBox({
    required this.sortItems,
    required this.selectedSort,
    required this.changeSortItem,
    required this.selectDate,
    required this.changeDate,
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
// sort value
    final List<DropdownMenuItem<String>> _sortMenuItems = sortItems
        .map(
          (value) => DropdownMenuItem(
            value: value,
            child: Text(value),
          ),
        )
        .toList();
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
                  // calendar
                  Row(
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
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
