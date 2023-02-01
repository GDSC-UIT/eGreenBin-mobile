import 'package:egreenbin/app/core/theme/text_styles.dart';
import 'package:egreenbin/app/global_widgets/card_comment.dart';
import 'package:egreenbin/app/modules/rating/rating_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/values/assets_image.dart';
import '../../../global_widgets/dialog_comment.dart';
import '../../../global_widgets/sort_box.dart';

class CardAllComments extends StatelessWidget {
  final RatingController _controller;
  const CardAllComments(this._controller, {super.key});

// show comment
  void showCommentForm(BuildContext context) {
    showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (ctx) => DiaLogComment(
        sortDialog: _controller.sortDialog!.value,
        textControler: _controller.textCotroller,
        onSave: () {
          // luu danh gia
          _controller.saveComment();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Container(
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
// loc theo
                const SizedBox(height: 30),
                Row(
                  children: [
                    const SizedBox(width: 21),
                    Obx(
                      () => SortBox(
                        textTitle: "Filter by".tr,
                        sortService: _controller.sortService!.value,
                      ),
                    ),
                  ],
                ),
// list comment
                const SizedBox(height: 5),
                Obx(() => Expanded(
                      child: _controller.listComments.isEmpty
                          ? Center(
                              child: Text(
                                "THERE ARE NO COMMENTS YET".tr,
                                style: CustomTextStyle.h2(AppColors.normal),
                              ),
                            )
                          : ListView.builder(
                              itemCount: _controller.listComments.length,
                              itemBuilder: (context, index) => CardComment(
                                _controller.listComments[index],
                                () => _controller.deleteComment(
                                    _controller.listComments[index]),
                              ),
                            ),
                    )),
                const SizedBox(height: 15),
              ],
            ),
          ),
// show more
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                showCommentForm(context);
              },
              child: Container(
                height: 35,
                width: 100,
                padding: const EdgeInsets.only(left: 10, right: 5),
                decoration: const BoxDecoration(
                  color: AppColors.normal,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 15,
                      child: Image.asset(Assets.chat),
                    ),
                    Text(
                      "Comment".tr,
                      style: CustomTextStyle.b7(AppColors.surface),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
