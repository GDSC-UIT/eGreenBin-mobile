import 'package:egreenbin/app/core/values/text_styles.dart';
import 'package:egreenbin/app/global_widgets/card_comment.dart';
import 'package:egreenbin/app/modules/rating/rating_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/sort_box.dart';

class CardAllComments extends StatelessWidget {
  final RatingController _controller;
  CardAllComments(this._controller);

  @override
  Widget build(BuildContext context) {
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
                Obx(
                  () => SortBox(
                    textTitle: "Lọc theo",
                    sortService: _controller.sortService!.value,
                  ),
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
