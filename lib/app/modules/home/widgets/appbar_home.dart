import 'package:egreenbin/app/core/values/app_colors.dart';
import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/core/values/text_styles.dart';
import 'package:egreenbin/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppbar extends StatelessWidget {
  HomeController _controller;
  String screenName = "TRANG CHỦ";

  HomeAppbar(this._controller);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 154,
              decoration: const BoxDecoration(
                color: AppColors.Normal,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(32),
                  bottomLeft: Radius.circular(32),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Image.asset(Assets.leaf3),
                      ),
                      /* Container(
                        child: Image.asset(Assets.leaf4),
                      ), */
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
// icon
        Positioned(
          top: 31,
          left: 31,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadow,
                  spreadRadius: 5,
                  blurRadius: 4,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: Image.asset(Assets.notification),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 70),
// text
                Text(
                  screenName,
                  style: CustomTextStyle.h1(Colors.white),
                ),
                const SizedBox(height: 23),
// card
                Container(
                  height: 75,
                  decoration: BoxDecoration(
                    color: AppColors.Surface,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.shadow,
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 6), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 30),
                      const CircleAvatar(
                        radius: 27,
                        backgroundColor: AppColors.Background,
                        child: Icon(Icons.person),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _controller.teacher.value.name,
                            style: CustomTextStyle.h2(AppColors.Normal),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "MGV: ${_controller.teacher.value.mgv}",
                            style: CustomTextStyle.b1(AppColors.Subtle_1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
// thung rac
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 180,
            child: Image.asset(Assets.bin),
          ),
        ),
      ],
    );
  }
}
