import 'package:egreenbin/app/core/values/text_styles.dart';
import 'package:egreenbin/app/global_widgets/card_comment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/sort_box.dart';
import '../student_info_controller.dart';

class CardEvaluate extends StatelessWidget {
  final StudentInfoController _controller;
  const CardEvaluate(this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Container(
            height: 320,
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
                const SizedBox(height: 38),
                Text(
                  "ĐÁNH GIÁ",
                  style: CustomTextStyle.h2(AppColors.primary1),
                ),
                const SizedBox(height: 5),
// loc theo
                Row(
                  children: [
                    const SizedBox(width: 21),
                    Obx(
                      () => SortBox(
                        textTitle: "Lọc theo",
                        sortService: _controller.sortCardEvaluate!.value,
                      ),
                    ),
                  ],
                ),
// list comment
                const SizedBox(height: 5),
                Obx(() => Expanded(
                      child: Container(
                        child: _controller.listComments.isEmpty
                            ? Center(
                                child: Text(
                                  "CHƯA CÓ ĐÁNH GIÁ NÀO",
                                  style: CustomTextStyle.h2(AppColors.normal),
                                ),
                              )
                            : ListView.builder(
                                itemCount: _controller.listComments.length,
                                itemBuilder: (context, index) => CardComment(
                                    _controller.listComments[index]),
                              ),
                      ),
                    )),
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
                _controller.pushToAllCommentScreen();
              },
              child: Container(
                height: 35,
                width: 100,
                padding: const EdgeInsets.only(left: 10, right: 5),
                decoration: const BoxDecoration(
                  color: AppColors.normal,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Xem tất cả",
                    style: CustomTextStyle.b7(AppColors.surface),
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
