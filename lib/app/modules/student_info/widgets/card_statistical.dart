import 'package:egreenbin/app/core/values/theme/text_styles.dart';
import 'package:egreenbin/app/modules/student_info/widgets/line_chart_sample1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/theme/app_colors.dart';
import '../student_info_controller.dart';

class CardStatistical extends StatelessWidget {
  final StudentInfoController _controller;

  const CardStatistical(this._controller, {super.key});

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
              color: AppColors.primarySubtle2,
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
// Thong ke
                const SizedBox(height: 38),
                Text(
                  "THỐNG KÊ",
                  style: CustomTextStyle.h2(AppColors.primary1),
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
                          color: AppColors.normal,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Đúng",
                          style: CustomTextStyle.b5(
                            AppColors.primary2,
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
                            AppColors.primary2,
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
                  child: const Center(
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
                color: AppColors.normal,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Obx(
                () => DropdownButton<String>(
                  style: CustomTextStyle.b2(AppColors.surface),
                  dropdownColor: AppColors.normal,
                  menuMaxHeight: 200,
                  value: _controller
                      .sortCardStatical!.value.selectedMonthSort.value,
                  onChanged: (String? newValue) {
                    _controller.sortCardStatical!.value
                        .changeSortMonthItem(newValue!);
                  },
                  items: _controller
                      .sortCardStatical!.value.dropdownSortMonthItems,
                  underline: Container(color: AppColors.normal),
                  icon: const Icon(
                    Icons.expand_more,
                    size: 25,
                    color: AppColors.surface,
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
