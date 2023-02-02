import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../data/models/student.dart';
import '../../../student_info/widgets/line_chart_sample1.dart';

// ignore: must_be_immutable
class Statistical extends StatelessWidget {
  Student student;
  Statistical(this.student, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 20),
            Text(
              "I. ${"STATISTICS".tr}",
              style: CustomTextStyle.h2(AppColors.normal),
            ),
          ],
        ),
        const SizedBox(height: 10),
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
                  "Right".tr,
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
                  "Wrong".tr,
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
      ],
    );
  }
}
