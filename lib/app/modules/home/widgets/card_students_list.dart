import 'package:egreenbin/app/core/values/app_values.dart';
import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/core/values/text_styles.dart';
import 'package:egreenbin/app/global_widgets/sort_box.dart';
import 'package:egreenbin/app/modules/home/home_controller.dart';
import 'package:egreenbin/app/modules/home/widgets/card_student.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../core/values/app_colors.dart';

class CardDSLop extends StatelessWidget {
  static HomeController _controller = Get.find<HomeController>();

  // dropButton class value
  final List<DropdownMenuItem<String>> _classMenuItems = _controller.classItems
      .map(
        (value) => DropdownMenuItem(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
  // sort value
  final List<DropdownMenuItem<String>> _sortMenuItems = _controller.sortItems
      .map(
        (value) => DropdownMenuItem(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
  // date picker
  void _presentDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) return;
        _controller.changeDate(pickedDate);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.PrimarySubtle2,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow,
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 6), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
// danh sach lop
                const SizedBox(height: 38),
                Text(
                  "DANH SÁCH LỚP",
                  style: CustomTextStyle.h2(AppColors.Primary1),
                ),
                const SizedBox(height: 2),
                Text(
                  "${_controller.numberOfStudent.value} học sinh",
                  style: CustomTextStyle.b1(AppColors.Subtle_1),
                ),
                const SizedBox(height: 5),
// loc theo
                Obx(
                  () => SortBox(
                    sortItems: _controller.sortItems,
                    selectedSort: _controller.selectedSort.value,
                    changeSortItem: _controller.changeSortItem,
                    selectDate: _controller.selectDate.value,
                    changeDate: _controller.changeDate,
                  ),
                ),
// list student
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount:
                          _controller.listStudent.value.listStudents.length,
                      itemBuilder: (context, i) => StudentCard(
                          i + 1, _controller.listStudent.value.listStudents[i]),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
// dropbutton
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: 30,
              padding: const EdgeInsets.only(left: 10, right: 5),
              decoration: const BoxDecoration(
                color: AppColors.Normal,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Obx(
                () => DropdownButton<String>(
                  style: CustomTextStyle.b2(AppColors.Surface),
                  dropdownColor: AppColors.Normal,
                  value: _controller.selectedClass.value,
                  onChanged: (String? newValue) {
                    _controller.changeClassItem(newValue!);
                  },
                  items: _classMenuItems,
                  underline: Container(color: AppColors.Normal),
                  icon: const Icon(
                    Icons.expand_more,
                    size: 25,
                    color: AppColors.Surface,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
