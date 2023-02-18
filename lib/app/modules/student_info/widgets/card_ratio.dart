import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../core/theme/app_colors.dart';
import '../../../global_widgets/dialog_comment.dart';
import '../../../global_widgets/sort_box.dart';
import '../student_info_controller.dart';

class CardRatio extends StatefulWidget {
  final StudentInfoController _controller;

  const CardRatio(this._controller, {super.key});

  @override
  State<CardRatio> createState() => _CardRatioState();
}

class _CardRatioState extends State<CardRatio> {
  // show comment
  void showCommentForm(BuildContext context) {
    showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (ctx) => DiaLogComment(
        sortDialog: widget._controller.sortDialog!.value,
        textControler: widget._controller.textCotroller,
        onSave: () {
          // luu danh gia
          widget._controller.saveComment();
        },
      ),
    );
  }

  double get ratio {
    if (widget._controller.student.value.numOfWrong == 0) return 1;
    return widget._controller.student.value.numOfCorrect! /
        (widget._controller.student.value.numOfWrong! +
            widget._controller.student.value.numOfCorrect!);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Container(
            height: 320,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primarySubtle2,
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
                  "SPECIFIC DATA".tr,
                  style: CustomTextStyle.h2(AppColors.primary1),
                ),
                const SizedBox(height: 5),
// loc theo
                Row(
                  children: [
                    const SizedBox(width: 21),
                    Obx(
                      () => SortBox(
                        textTitle: "Filter by".tr,
                        sortService: widget._controller.sortCardRatio!.value,
                      ),
                    ),
                  ],
                ),
// two face
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // play animation when tap
                    setState(() {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
//face happy
                      Row(
                        children: [
                          SizedBox(
                            height: 80,
                            child: Image.asset(Assets.faceHappy)
                                .animate(
                                  onPlay: (controller) =>
                                      controller.isAnimating,
                                )
                                .scaleXY(end: 1.1, duration: 600.ms)
                                .then(delay: 200.ms)
                                .scaleXY(end: 1 / 1.1),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            children: [
                              Text(
                                "${"Right".tr}:",
                                style: CustomTextStyle.b6(
                                  AppColors.normal,
                                ),
                              ),
// text number of right
                              Obx(
                                () => Text(
                                  "${widget._controller.numOfRight.value}",
                                  style: CustomTextStyle.h3(
                                    AppColors.normal,
                                  ),
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
                            child: Image.asset(Assets.faceSad)
                                .animate(
                                  onPlay: (controller) =>
                                      controller.isAnimating,
                                )
                                .scaleXY(end: 1.1, duration: 600.ms)
                                .then(delay: 300.ms)
                                .scaleXY(end: 1 / 1.1),
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
// text number of wrong
                              Obx(() => Text(
                                    "${widget._controller.numOfWrong.value}",
                                    style: CustomTextStyle.h3(
                                      AppColors.wrong,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
// process bar
                Container(
                  height: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 55),
                  child: LinearPercentIndicator(
                    animation: true,
                    animationDuration: 2500,
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
            ),
          ),
// dropbutton
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                showCommentForm(context);
              },
              child: Container(
                height: 35,
                width: 100,
                padding: const EdgeInsets.only(left: 10, right: 5),
                decoration: const BoxDecoration(
                  color: AppColors.normal,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
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
                      "Comment".tr,
                      style: CustomTextStyle.b7(AppColors.surface),
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
