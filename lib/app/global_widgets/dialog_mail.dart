import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/global_widgets/sort_box.dart';
import 'package:egreenbin/app/modules/mail/mail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/values/app_colors.dart';
import '../core/values/text_styles.dart';

class DiaLogMail extends StatefulWidget {
  MailController mailController;
  TextEditingController textController;
  final Function onSave;

  DiaLogMail({
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
    widget.textController.clear();
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
              children: [
// text noi dung thu
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "NỘI DUNG THƯ",
                    style: CustomTextStyle.h2(AppColors.primary1),
                  ),
                ),
                const SizedBox(height: 5),
// sort box: ket qua
                Row(
                  children: [
                    Obx(
                      () => SortBox(
                        textTitle: "Kết quả",
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
                      "Ghi chú đặc biệt",
                      style: CustomTextStyle.b2(AppColors.subtle_1),
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      controller: widget.textController,
                      style: CustomTextStyle.b7(AppColors.subtle_1),
                      maxLines: 4,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.primary1, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: "Thêm ghi chú",
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
                if (isNull) return;
                widget.onSave();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors.normal, // mau button
                onPrimary: AppColors.primarySubtle2, // mau chu
              ),
              child: Text(
                "Cập nhập",
                style: CustomTextStyle.b6(AppColors.primarySubtle2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
