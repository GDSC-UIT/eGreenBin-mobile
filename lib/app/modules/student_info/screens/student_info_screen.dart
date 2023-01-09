import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/global_widgets/appbar_student.dart';
import 'package:egreenbin/app/modules/student_info/student_info_controller.dart';
import 'package:egreenbin/app/modules/student_info/widgets/card_ratio.dart';
import 'package:egreenbin/app/modules/student_info/widgets/card_statistical.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentInfoScreen extends StatelessWidget {
  StudentInfoController _controller = Get.find<StudentInfoController>();

  void backToPrevScreen() {
    Get.back();
  }

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
                  CardStatistical(),
                  // card so lan dung sai
                  const SizedBox(height: 30),
                  CardRatio(),
                  // card danh gia
                  const SizedBox(height: 30),
                  CardStatistical(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          // appbar
          StudentAppBar(_controller.student, backToPrevScreen),
        ],
      ),
    );
  }
}
