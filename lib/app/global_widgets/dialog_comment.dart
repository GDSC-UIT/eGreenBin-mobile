import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/global_widgets/sort_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/values/app_colors.dart';
import '../core/values/text_styles.dart';
import '../modules/student_info/student_info_controller.dart';

// ignore: must_be_immutable
class DiaLogComment extends StatefulWidget {
  StudentInfoController studentController;
  TextEditingController textControler;
  final Function onSave;

  DiaLogComment({
    super.key,
    required this.studentController,
    required this.textControler,
    required this.onSave,
  });

  @override
  State<DiaLogComment> createState() => _DiaLogCommentState();
}

class _DiaLogCommentState extends State<DiaLogComment> {
  bool isNull = true;

  void onCancel() {
    Navigator.of(context).pop();
    widget.textControler.clear();
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
// text Danh gia
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "ĐÁNH GIÁ",
                    style: CustomTextStyle.h2(AppColors.primary1),
                  ),
                ),
                const SizedBox(height: 5),
// sort box: thoi gian
                Row(
                  children: [
                    Obx(
                      () => SortBox(
                        textTitle: "Thời gian",
                        sortService: widget.studentController.sortDialog!.value,
                        isInDialog: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 17),
// textField: noi dung
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nội dung",
                      style: CustomTextStyle.b2(AppColors.subtle_1),
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      controller: widget.textControler,
                      style: CustomTextStyle.b7(AppColors.subtle_1),
                      maxLines: 4,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.primary1, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: "Thêm đánh giá",
                      ),
                      onChanged: (value) {
                        setState(() {
                          isNull = (value.trim() == "");
                        });
                      },
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
            width: 110,
            child: ElevatedButton(
              onPressed: () {
                if (isNull) return;
                widget.onSave();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.primarySubtle2,
                backgroundColor: AppColors.normal, // mau chu
              ),
              child: Text(
                "Đăng",
                style: CustomTextStyle.b6(AppColors.primarySubtle2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
