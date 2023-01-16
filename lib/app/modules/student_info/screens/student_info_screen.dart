import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/global_widgets/appbar_student.dart';
import 'package:egreenbin/app/modules/student_info/widgets/card_evaluate.dart';
import 'package:egreenbin/app/modules/student_info/student_info_controller.dart';
import 'package:egreenbin/app/modules/student_info/widgets/card_ratio.dart';
import 'package:egreenbin/app/modules/student_info/widgets/card_statistical.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/dialog_comment.dart';
import '../../../routes/app_routes.dart';

class StudentInfoScreen extends StatelessWidget {
  StudentInfoController _controller = Get.find<StudentInfoController>();
  TextEditingController _textCotroller = TextEditingController();
  void backToPrevScreen() {
    Get.back();
  }

  void showCommentForm(BuildContext context) {
    showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (ctx) => DiaLogComment(
        studentController: _controller,
        textControler: _textCotroller,
        onSave: () {
          // luu danh gia
          _textCotroller.clear();
        },
      ),
    );
  }

  void pushToAllCommentScreen() {
    if (_controller.listComments.length == 0) return;
    Get.toNamed(AppRoutes.rating, arguments: _controller.student.value.id);
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
                  CardStatistical(_controller),
                  // card so lan dung sai
                  const SizedBox(height: 30),
                  CardRatio(_controller, showCommentForm),
                  // card danh gia
                  const SizedBox(height: 30),
                  CardEvaluate(_controller, pushToAllCommentScreen),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          // appbar
          StudentAppBar(_controller.student.value, backToPrevScreen),
        ],
      ),
    );
  }
}
