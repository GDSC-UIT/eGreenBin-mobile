import 'package:egreenbin/app/core/extensions/double_ex.dart';
import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/text_styles.dart';

// ignore: must_be_immutable
class DiaLogAddStudent extends StatefulWidget {
  DiaLogAddStudent();

  @override
  State<DiaLogAddStudent> createState() => _DiaLogAddStudentState();
}

class _DiaLogAddStudentState extends State<DiaLogAddStudent> {
  bool isNull = true;

  void onCancel() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding:
          const EdgeInsets.only(top: 15, left: 22, right: 22, bottom: 0),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: Stack(
        children: [
// cancel button
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onCancel,
              child: Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                  color: AppColors.primarySubtle2,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow,
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: SizedBox(
                    height: 20,
                    child: Image.asset(Assets.exit),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60.0.hp,
            width: 56.0.wp,
            child: Column(
              children: [
// text Danh gia
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "NEW STUDENT".tr,
                    style: CustomTextStyle.h2(AppColors.primary1),
                  ),
                ),
                const SizedBox(height: 5),
// textField: noi dung
              ],
            ),
          ),
        ],
      ),
// button dang
      actions: [
        Center(
          child: SizedBox(
            width: 110,
            child: ElevatedButton(
              onPressed: () {
                if (isNull) return;
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.primarySubtle2,
                backgroundColor: AppColors.normal, // mau chu
              ),
              child: Text(
                "Add".tr,
                style: CustomTextStyle.b6(AppColors.primarySubtle2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
