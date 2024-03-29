import 'package:auto_size_text/auto_size_text.dart';
import 'package:egreenbin/app/core/extensions/buildcontext_ex.dart';
import 'package:egreenbin/app/core/theme/app_colors.dart';
import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/core/theme/text_styles.dart';
import 'package:egreenbin/app/global_widgets/switch_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/student.dart';
import 'image_avatar.dart';

// ignore: must_be_immutable
class StudentAppBar extends StatelessWidget {
  String screenName;
  Student student;
  Function? backToPrevSreen;
  StudentAppBar(this.screenName, this.student, this.backToPrevSreen,
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
                      Image.asset(Assets.leaf4),
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
          child: InkWell(
            onTap: () {
              backToPrevSreen!();
            },
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.only(right: 3),
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
              child: Image.asset(Assets.back),
            ),
          ),
        ),
// switch languge
        const Positioned(
          top: 35,
          right: 25,
          child: SwitchLanguage(),
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
                      const SizedBox(width: 20),
// avatar
                      ImageAvatar(imageAvatarUrl: student.imageAvatarUrl),
                      const SizedBox(width: 20),
// text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: context.screenSize.width * 0.5,
                            child: Text(
                              student.name,
                              style: CustomTextStyle.h2(AppColors.normal),
                            ),
                          ),
                          const SizedBox(height: 4),
                          SizedBox(
                            width: context.screenSize.width * 0.5,
                            child: AutoSizeText(
                              "${"CodeStudent".tr}: ${student.code}",
                              style: CustomTextStyle.b1(AppColors.subtle_1),
                              maxLines: 1,
                              minFontSize: 5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
