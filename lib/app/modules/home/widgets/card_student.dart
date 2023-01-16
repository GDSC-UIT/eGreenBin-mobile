import 'package:egreenbin/app/core/values/app_colors.dart';
import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/core/values/text_styles.dart';
import 'package:egreenbin/app/data/models/student.dart';
import 'package:egreenbin/app/modules/student_info/screens/student_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class StudentCard extends StatelessWidget {
  int index = 0;
  Student student;

  StudentCard(this.index, this.student);

  String get indexFormat {
    if (index < 10) return '0${index}';
    return '${index}';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.studentInfo, arguments: student.id);
      },
      child: Container(
        child: Card(
          color: AppColors.primarySubtle2,
          elevation: 0,
          child: Container(
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
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.background,
                  child: Icon(
                    Icons.person,
                    color: AppColors.subtle_2,
                  ),
                ),
                // column
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      student.name,
                      style: CustomTextStyle.b1(AppColors.primary1),
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
        ),
      ),
    );
  }
}
