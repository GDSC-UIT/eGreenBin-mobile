import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/global_widgets/appbar_student.dart';
import 'package:egreenbin/app/modules/student_info/widgets/card_evaluate.dart';
import 'package:egreenbin/app/modules/student_info/student_info_controller.dart';
import 'package:egreenbin/app/modules/student_info/widgets/card_ratio.dart';
import 'package:egreenbin/app/modules/student_info/widgets/card_statistical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class StudentInfoScreen extends StatelessWidget {
  final StudentInfoController _controller = Get.find<StudentInfoController>();

  StudentInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.backround), fit: BoxFit.fill),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // appbar height
                  const SizedBox(height: 215),
                  // card thong ke
                  CardStatistical(_controller),
                  // card so lan dung sai
                  const SizedBox(height: 30),
                  CardRatio(_controller),
                  // card danh gia
                  const SizedBox(height: 30),
                  CardEvaluate(_controller),
                  const SizedBox(height: 30),
                ]
                    .animate(interval: 150.ms)
                    .scaleXY(begin: 0.5, duration: 600.ms)
                    .fade(delay: 200.ms),
              ),
            ),
          ),
          // appbar
          StudentAppBar(
            "REPORTS".tr,
            _controller.student.value,
            _controller.backToPrevScreen,
          ),
        ],
      ),
    );
  }
}
