import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/modules/home/home_controller.dart';
import 'package:egreenbin/app/modules/home/widgets/appbar_home.dart';
import 'package:egreenbin/app/modules/home/widgets/card_students_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';

class HomeScreen extends StatelessWidget {
  HomeController _controller = Get.find<HomeController>();

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
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // appbar
                  HomeAppbar(_controller),
                  const SizedBox(height: 15),
                  // card has list student
                  CardDSLop(_controller),
                ],
              ),
// button right bottom
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 44,
                  width: 123,
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  decoration: const BoxDecoration(
                    color: AppColors.Normal,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
// refresh button
                      InkWell(
                        onTap: () {
                          _controller.refresh();
                        },
                        child: SizedBox(
                          height: 30,
                          child: Image.asset(Assets.refresh),
                        ),
                      ),
// mail button
                      InkWell(
                        onTap: () {
                          _controller.pushToMailScreen();
                        },
                        child: SizedBox(
                          height: 30,
                          child: Image.asset(Assets.mail),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
