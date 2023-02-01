import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/values/assets_image.dart';
import '../../../../data/models/student.dart';

// ignore: must_be_immutable
class Ratio extends StatelessWidget {
  Student student;
  Ratio(this.student, {super.key});

  double get ratio {
    if (student.numOfWrong == 0) return 1;
    return student.numOfCorrect! /
        (student.numOfWrong! + student.numOfCorrect!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // text: So lan dung sai
        const SizedBox(height: 12),
        Row(
          children: [
            const SizedBox(width: 20),
            Text(
              "II. " "SPECIFIC DATA".tr,
              style: CustomTextStyle.h2(AppColors.normal),
            ),
          ],
        ),
        const SizedBox(height: 5),
// two face
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
//face happy
            Row(
              children: [
                SizedBox(height: 80, child: Image.asset(Assets.faceHappy)),
                const SizedBox(width: 12),
                Column(
                  children: [
                    Text(
                      "${"Right".tr}:",
                      style: CustomTextStyle.b6(
                        AppColors.normal,
                      ),
                    ),
                    Text(
                      "${student.numOfCorrect!}",
                      style: CustomTextStyle.h3(
                        AppColors.normal,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(width: 30),
// face sad
            Row(
              children: [
                SizedBox(
                  height: 80,
                  child: Image.asset(Assets.faceSad),
                ),
                const SizedBox(width: 12),
                Column(
                  children: [
                    Text(
                      "${"Wrong".tr}:",
                      style: CustomTextStyle.b6(
                        AppColors.wrong,
                      ),
                    ),
                    Text(
                      "${student.numOfWrong!}",
                      style: CustomTextStyle.h3(
                        AppColors.wrong,
                      ),
                    ),
                  ],
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
            animationDuration: 0,
            lineHeight: 40,
            percent: ratio,
            barRadius: const Radius.circular(50),
            progressColor: AppColors.normal,
            backgroundColor: AppColors.wrong,
          ),
        ),
// text: ti le bo dung
        const SizedBox(height: 15),
        RichText(
          text: TextSpan(
            text: 'Percentages of doing right: '.tr,
            style: CustomTextStyle.b2(AppColors.subtle_1),
            children: [
              TextSpan(
                text: "${(ratio * 100).toStringAsFixed(0)}%",
                style: CustomTextStyle.b2(AppColors.normal),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
