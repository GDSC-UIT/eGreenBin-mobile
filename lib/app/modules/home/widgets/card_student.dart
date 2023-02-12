import 'package:egreenbin/app/core/extensions/buildcontext_ex.dart';
import 'package:egreenbin/app/core/theme/app_colors.dart';
import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/core/theme/text_styles.dart';
import 'package:egreenbin/app/data/models/student.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// ignore: must_be_immutable
class StudentCard extends StatelessWidget {
  int index = 0;
  Student student;
  Function pushToStudentInfo;

  StudentCard(this.index, this.student, this.pushToStudentInfo, {super.key});

  String get indexFormat {
    if (index < 10) return '0$index';
    return '$index';
  }

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        pushToStudentInfo(student.id);
      },
      child: Card(
        color: AppColors.primarySubtle2,
        elevation: 0,
        child: Row(
          children: [
            // num
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 5),
              child: SizedBox(
                width: 30,
                child: Text(
                  indexFormat,
                  style: CustomTextStyle.b4(AppColors.normal),
                ),
              ),
            ),
            //avatar
            CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.background,
              child: student.imageAvatarUrl == null
                  ? const Icon(
                      Icons.person,
                      color: AppColors.subtle_2,
                    )
                  : Image.network(student.imageAvatarUrl!),
            ),
            // column
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.screenSize.width * 0.5,
                  child: Text(
                    student.name,
                    style: CustomTextStyle.b1(AppColors.primary1),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 16,
                            child: Image.asset(Assets.tickSquare),
                          ),
                          const SizedBox(width: 7),
                          Text(
                            student.numOfCorrect.toString(),
                            style: CustomTextStyle.b1(AppColors.normal),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 16,
                          child: Image.asset(Assets.wrongSqure),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          student.numOfWrong.toString(),
                          style: CustomTextStyle.b1(AppColors.wrong),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
