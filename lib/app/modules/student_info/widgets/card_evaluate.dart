import 'package:egreenbin/app/core/values/text_styles.dart';
import 'package:egreenbin/app/global_widgets/card_comment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../student_info_controller.dart';

class CardEvaluate extends StatelessWidget {
  StudentInfoController _controller;
  Function pushToAllScreen;
  CardEvaluate(this._controller, this.pushToAllScreen);

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<String>> _sortMenuItems =
        _controller.sortCommentItems
            .map(
              (value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ),
            )
            .toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Container(
            height: 320,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.PrimarySubtle2,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
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
            child: Column(
              children: [
// text: Danh gia
                const SizedBox(height: 38),
                Text(
                  "ĐÁNH GIÁ",
                  style: CustomTextStyle.h2(AppColors.Primary1),
                ),
                const SizedBox(height: 5),
// loc theo
                Row(
                  children: [
                    const SizedBox(width: 21),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lọc theo",
                          style: CustomTextStyle.b2(AppColors.Subtle_1),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.PrimarySubtle2,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: AppColors.Primary1,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Obx(
                              () => DropdownButton<String>(
                                style: CustomTextStyle.b3(AppColors.Normal),
                                dropdownColor: AppColors.PrimarySubtle2,
                                value: _controller.SelectedSortComment.value,
                                onChanged: (String? newValue) {
                                  _controller.changeSortCommentItem(newValue!);
                                },
                                items: _sortMenuItems,
                                underline:
                                    Container(color: AppColors.PrimarySubtle2),
                                icon: const Icon(
                                  Icons.expand_more,
                                  size: 18,
                                  color: AppColors.Normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
// list comment
                const SizedBox(height: 5),
                Expanded(
                  child: Container(
                    child: _controller.listComments.length == 0
                        ? Center(
                            child: Text(
                              "CHƯA CÓ ĐÁNH GIÁ NÀO",
                              style: CustomTextStyle.h2(AppColors.Normal),
                            ),
                          )
                        : ListView.builder(
                            itemCount: _controller.listComments.length,
                            itemBuilder: (context, index) =>
                                CardComment(_controller.listComments[index]),
                          ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
// dropbutton
          Positioned(
            top: 0,
            left: 0,
            child: GestureDetector(
              onTap: () {
                pushToAllScreen();
              },
              child: Container(
                height: 35,
                width: 100,
                padding: const EdgeInsets.only(left: 10, right: 5),
                decoration: const BoxDecoration(
                  color: AppColors.Normal,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Xem tất cả",
                    style: CustomTextStyle.b7(AppColors.Surface),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
