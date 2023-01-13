import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../global_widgets/sort_box.dart';
import '../student_info_controller.dart';

class CardRatio extends StatelessWidget {
  StudentInfoController _controller;
  Function showCommentForm;

  CardRatio(this._controller, this.showCommentForm);

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

  double get Ratio {
    if (_controller.student.value.numOfWrong == 0) return 1;
    return _controller.student.value.numOfCorrect! /
        (_controller.student.value.numOfWrong! +
            _controller.student.value.numOfCorrect!);
  }

  @override
  Widget build(BuildContext context) {
    // sort value
    final List<DropdownMenuItem<String>> _sortMenuItems = _controller.sortItems
        .map(
          (value) => DropdownMenuItem(
            value: value,
            child: Text(value),
          ),
        )
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Container(
            height: 320,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.PrimarySubtle2,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
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
// text: So lan dung sai
                const SizedBox(height: 12),
                Text(
                  "SỐ LẦN ĐÚNG/SAI",
                  style: CustomTextStyle.h2(AppColors.Primary1),
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
                    sortWeekItems: _controller.sortWeekItems,
                    selectedWeekSort: _controller.selectedWeekSort.value,
                    changeSortWeekItem: _controller.changeSortWeekItem,
                    sortMonthItems: _controller.sortMonthItems,
                    selectedMonthSort:
                        _controller.selectedMonthSortCardRatio.value,
                    changeSortMonthItem: _controller.changeMonthItemCardRatio,
                  ),
                ),
// two face
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //face happy
                    Row(
                      children: [
                        SizedBox(
                          height: 80,
                          child: Image.asset(Assets.faceHappy),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Đúng: ${_controller.student.value.numOfCorrect}",
                          style: CustomTextStyle.h2(
                            AppColors.Normal,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 12),
                    // face sad
                    Row(
                      children: [
                        SizedBox(
                          height: 80,
                          child: Image.asset(Assets.faceSad),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Sai: ${_controller.student.value.numOfWrong}",
                          style: CustomTextStyle.h2(
                            AppColors.wrong,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
// process bar
                Container(
                  height: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 55),
                  child: LinearPercentIndicator(
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 40,
                    percent: Ratio,
                    barRadius: const Radius.circular(50),
                    progressColor: AppColors.Normal,
                    backgroundColor: AppColors.wrong,
                  ),
                ),
// text: ti le bo dung
                const SizedBox(height: 15),
                RichText(
                  text: TextSpan(
                    text: 'Tỉ lệ bỏ đúng: ',
                    style: CustomTextStyle.b2(AppColors.Subtle_1),
                    children: [
                      TextSpan(
                        text: "${(Ratio * 100).toStringAsFixed(0)}%",
                        style: CustomTextStyle.b2(AppColors.Normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
// dropbutton
          Positioned(
            bottom: 0,
            left: 0,
            child: GestureDetector(
              onTap: () {
                showCommentForm(context);
              },
              child: Container(
                height: 35,
                width: 100,
                padding: const EdgeInsets.only(left: 10, right: 5),
                decoration: const BoxDecoration(
                  color: AppColors.Normal,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 15,
                      child: Image.asset(Assets.chat),
                    ),
                    Text(
                      "Đánh giá",
                      style: CustomTextStyle.b7(AppColors.Surface),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
