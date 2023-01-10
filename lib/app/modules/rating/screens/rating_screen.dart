import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/global_widgets/appbar_student.dart';
import 'package:egreenbin/app/modules/student_info/widgets/card_evaluate.dart';
import 'package:egreenbin/app/modules/rating/rating_controller.dart';
import 'package:egreenbin/app/modules/student_info/widgets/card_ratio.dart';
import 'package:egreenbin/app/modules/student_info/widgets/card_statistical.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingScreen extends StatelessWidget {
  final RatingController _controller = Get.find<RatingController>();

  void backToPrevScreen() {
    Get.back();
  }

  void showCommentForm() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.backround), fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // appbar
              StudentAppBar(_controller.student.value, backToPrevScreen),
              // card danh gia
              const SizedBox(height: 30),
              //CardEvaluate(_controller.listComments, 350),
            ],
          ),
        ),
      ),
    );
  }
}
