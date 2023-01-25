import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/global_widgets/appbar_student.dart';
import 'package:egreenbin/app/modules/rating/widgets/card_all_comments.dart';
import 'package:egreenbin/app/modules/rating/rating_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingScreen extends StatelessWidget {
  final RatingController _controller = Get.find<RatingController>();

  RatingScreen({super.key});

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
              StudentAppBar(
                  _controller.student.value, _controller.backToPrevScreen),
              // card danh gia
              const SizedBox(height: 20),
              CardAllComments(_controller),
            ],
          ),
        ),
      ),
    );
  }
}
