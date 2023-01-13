import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/global_widgets/sort_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/values/app_colors.dart';
import '../core/values/text_styles.dart';
import '../modules/student_info/student_info_controller.dart';

class DiaLogComment extends StatefulWidget {
  StudentInfoController studentController;
  TextEditingController textControler;
  final Function onSave;
  DiaLogComment({
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
                  color: AppColors.PrimarySubtle2,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow,
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 6), // changes position of shadow
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
          Container(
            height: 270,
            child: Column(
              children: [
// text Danh gia
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "ĐÁNH GIÁ",
                    style: CustomTextStyle.h2(AppColors.Primary1),
                  ),
                ),
                const SizedBox(height: 5),
// sort box: thoi gian
                Row(
                  children: [
                    Obx(
                      () => SortBox(
                        textTitle: "Thời gian",
                        sortItems: widget.studentController.sortItems,
                        selectedSort:
                            widget.studentController.selectedSort.value,
                        changeSortItem: widget.studentController.changeSortItem,
                        selectDate: widget.studentController.selectDate.value,
                        changeDate: widget.studentController.changeDate,
                        sortWeekItems: widget.studentController.sortWeekItems,
                        selectedWeekSort:
                            widget.studentController.selectedWeekSort.value,
                        changeSortWeekItem:
                            widget.studentController.changeSortWeekItem,
                        sortMonthItems: widget.studentController.sortMonthItems,
                        selectedMonthSort: widget
                            .studentController.selectedMonthSortCardRatio.value,
                        changeSortMonthItem:
                            widget.studentController.changeMonthItemCardRatio,
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
                      style: CustomTextStyle.b2(AppColors.Subtle_1),
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      controller: widget.textControler,
                      style: CustomTextStyle.b7(AppColors.Subtle_1),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.Primary1, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: "Thêm đánh giá",
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (value.trim() == "")
                            isNull = true;
                          else
                            isNull = false;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: 110,
                  child: ElevatedButton(
                    onPressed: isNull
                        ? null
                        : () {
                            widget.onSave();
                            Navigator.of(context).pop();
                          },
                    child: Text(
                      "Đăng",
                      style: CustomTextStyle.b6(AppColors.PrimarySubtle2),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.Normal, // mau button
                      onPrimary: AppColors.PrimarySubtle2, // mau chu
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
