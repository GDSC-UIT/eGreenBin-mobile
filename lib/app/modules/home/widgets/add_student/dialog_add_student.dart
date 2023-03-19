import 'package:egreenbin/app/core/extensions/double_ex.dart';
import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/modules/home/widgets/add_student/form_add_student.dart';
import 'package:egreenbin/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

// tham khao: https://github.com/minhphan46/Shop_app/blob/main/lib/screens/edit_product_screen.dart
// https://github.com/minhphan46/chat_app/blob/main/lib/widgets/auth/auth_form.dart
// ignore: must_be_immutable
class DiaLogAddStudent extends StatefulWidget {
  HomeController homeCotroller;
  DiaLogAddStudent(this.homeCotroller, {super.key});

  @override
  State<DiaLogAddStudent> createState() => _DiaLogAddStudentState();
}

class _DiaLogAddStudentState extends State<DiaLogAddStudent> {
  void onCancel() {
    Navigator.of(context).pop();
    widget.homeCotroller.imageStudent = null;
  }

  bool isloading = false;
  Future<void> submitAdd() async {
    EasyLoading.show(status: 'loading...');

    await widget.homeCotroller.trySubmitAddStudent();

    EasyLoading.dismiss();
    onCancel();
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
      alignment: Alignment.center,
      content: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: 58.0.hp,
              width: 56.0.wp,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // text new student
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "NEW STUDENT".tr,
                        style: CustomTextStyle.h2(AppColors.primary1),
                      ),
                    ),
                    SizedBox(height: 1.5.hp),
                    // form dang ky
                    FormAddStudent(widget.homeCotroller),
                  ],
                ),
              ),
            ),
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
          ],
        ),
      ),
// button dang
      actions: [
        Center(
          child: SizedBox(
            width: 110,
            child: ElevatedButton(
              onPressed: submitAdd,
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
