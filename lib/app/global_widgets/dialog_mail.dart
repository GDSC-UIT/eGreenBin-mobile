import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/global_widgets/sort_box.dart';
import 'package:egreenbin/app/modules/mail/mail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/text_styles.dart';

// ignore: must_be_immutable
class DiaLogMail extends StatefulWidget {
  MailController mailController;
  TextEditingController textController;
  final Function onSave;

  DiaLogMail({
    super.key,
    required this.mailController,
    required this.textController,
    required this.onSave,
  });

  @override
  State<DiaLogMail> createState() => _DiaLogMailState();
}

class _DiaLogMailState extends State<DiaLogMail> {
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
            height: MediaQuery.of(context).size.height * 0.32,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
// text noi dung thu
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "MAIL CONTENT".tr,
                    style: CustomTextStyle.h2(AppColors.primary1),
                  ),
                ),
                const SizedBox(height: 5),
// sort box: ket qua
                Row(
                  children: [
                    Obx(
                      () => SortBox(
                        textTitle: "Result".tr,
                        sortService: widget.mailController.sortService!.value,
                        isInDialog: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 17),
// textField: ghi chu
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Message to student's parents".tr,
                      style: CustomTextStyle.b2(AppColors.subtle_1),
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      controller: widget.textController,
                      style: CustomTextStyle.b7(AppColors.subtle_1),
                      maxLines: 4,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.primary1, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: "Add Mesage".tr,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
// button dang
      actions: [
        Center(
          child: SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {
                // ignore: deprecated_member_use
                if (isNull) return;
                widget.onSave();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.primarySubtle2,
                backgroundColor: AppColors.normal, // mau chu
              ),
              child: Text(
                "Save".tr,
                style: CustomTextStyle.b6(AppColors.primarySubtle2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
