import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
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
              color: AppColors.Surface,
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
                Row(
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
                            color: AppColors.Surface,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: AppColors.Primary1,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // lua chon ngay, thang, nam
                              Obx(
                                () => DropdownButton<String>(
                                  style: CustomTextStyle.b3(AppColors.Normal),
                                  dropdownColor: AppColors.Surface,
                                  value: _controller.selectedSort.value,
                                  onChanged: (String? newValue) {
                                    _controller.changeSortItem(newValue!);
                                  },
                                  items: _sortMenuItems,
                                  underline:
                                      Container(color: AppColors.Surface),
                                  icon: const Icon(
                                    Icons.expand_more,
                                    size: 18,
                                    color: AppColors.Normal,
                                  ),
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
                                  Obx(
                                    () => Container(
                                      width: 80,
                                      child: Text(
                                        _controller.selectDate.value == null
                                            ? '01/01/2023'
                                            : '${DateFormat(FormatValue.numbericDateFormat).format(_controller.selectDate.value! as DateTime)}',
                                        style: CustomTextStyle.b3(
                                            AppColors.Normal),
                                      ),
                                    ),
                                  ),
                                  //const SizedBox(width: 5),
                                  GestureDetector(
                                    onTap: () => _presentDatePicker(context),
                                    child: Container(
                                      height: 20,
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
                showCommentForm();
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
