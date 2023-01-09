import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/global_widgets/appbar_student.dart';
import 'package:egreenbin/app/modules/student_info/student_info_controller.dart';
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.backround), fit: BoxFit.fill),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
// appbar
              StudentAppBar(_controller.student, backToPrevScreen),
              const SizedBox(height: 15),
// card thong ke
              CardStatistical(),
// card so lan dung sai

// card danh gia
            ],
          ),
        ),
      ),
    );
  }
}
