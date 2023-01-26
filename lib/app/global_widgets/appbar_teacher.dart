import 'package:egreenbin/app/core/values/theme/app_colors.dart';
import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/core/values/theme/text_styles.dart';
import 'package:egreenbin/app/data/models/teacher.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarTeacher extends StatelessWidget {
  Teacher teacher;
  Function function;
  String screenName = "TRANG CHỦ";
  Widget icon;

  AppbarTeacher(this.screenName, this.teacher, this.function, this.icon,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 154,
              decoration: const BoxDecoration(
                color: AppColors.normal,
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
                      Image.asset(Assets.leaf3),
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
          child: GestureDetector(
            onTap: () {
              function();
            },
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
              child: Center(child: icon),
            ),
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
                    color: AppColors.surface,
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
                        backgroundColor: AppColors.background,
                        child: Icon(Icons.person),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              teacher.name,
                              style: CustomTextStyle.h2(AppColors.normal),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "MGV: ${teacher.id}",
                            style: CustomTextStyle.b1(AppColors.subtle_1),
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
          child: SizedBox(
            height: 180,
            child: Image.asset(Assets.bin),
          ),
        ),
      ],
    );
  }
}
