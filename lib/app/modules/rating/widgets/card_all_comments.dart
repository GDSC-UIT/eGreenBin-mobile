import 'package:egreenbin/app/core/values/text_styles.dart';
import 'package:egreenbin/app/global_widgets/card_comment.dart';
import 'package:egreenbin/app/modules/rating/rating_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';

class CardAllComments extends StatelessWidget {
  RatingController _controller;
  CardAllComments(this._controller);

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
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.primarySubtle2,
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
            const SizedBox(height: 20),
            Text(
              "TẤT CẢ ĐÁNH GIÁ",
              style: CustomTextStyle.h2(AppColors.primary1),
            ),
            const SizedBox(height: 10),
// loc theo
            Row(
              children: [
                const SizedBox(width: 21),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lọc theo",
                      style: CustomTextStyle.b2(AppColors.subtle_1),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primarySubtle2,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: AppColors.primary1,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Obx(
                          () => DropdownButton<String>(
                            style: CustomTextStyle.b3(AppColors.normal),
                            dropdownColor: AppColors.primarySubtle2,
                            value: _controller.SelectedSortComment.value,
                            onChanged: (String? newValue) {
                              _controller.changeSortCommentItem(newValue!);
                            },
                            items: _sortMenuItems,
                            underline:
                                Container(color: AppColors.primarySubtle2),
                            icon: const Icon(
                              Icons.expand_more,
                              size: 18,
                              color: AppColors.normal,
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
              child: ListView.builder(
                itemCount: _controller.listComments.length,
                itemBuilder: (context, index) =>
                    CardComment(_controller.listComments[index]),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
