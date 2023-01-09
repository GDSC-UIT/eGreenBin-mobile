import 'package:egreenbin/app/core/values/app_values.dart';
import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/core/values/text_styles.dart';
import 'package:egreenbin/app/modules/home/widgets/card_student.dart';
import 'package:egreenbin/app/modules/student_info/widgets/line_chart_sample1.dart';
import 'package:egreenbin/app/modules/student_info/widgets/line_chart_sample2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../core/values/app_colors.dart';
import '../student_info_controller.dart';

class CardStatistical extends StatelessWidget {
  static StudentInfoController _controller = Get.find<StudentInfoController>();

  // dropButton class value
  final List<DropdownMenuItem<String>> _classMenuItems = _controller.monthItems
      .map(
        (value) => DropdownMenuItem(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Container(
            //height: 270,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.Surface,
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
                  "THỐNG KÊ",
                  style: CustomTextStyle.h2(AppColors.Primary1),
                ),
                const SizedBox(height: 5),
// box dung sai
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 15,
                          width: 31,
                          color: AppColors.Normal,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Đúng",
                          style: CustomTextStyle.b5(
                            AppColors.Primary2,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 20),
                    Row(
                      children: [
                        Container(
                          height: 15,
                          width: 31,
                          color: AppColors.wrong,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Sai",
                          style: CustomTextStyle.b5(
                            AppColors.Primary2,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
// chart
                Container(
                  //height: 300,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: LineChartSample1(),
                  ),
                ),
                const SizedBox(height: 10),
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
                  value: _controller.selectedMonth.value,
                  onChanged: (String? newValue) {
                    _controller.changeMonthItem(newValue!);
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
