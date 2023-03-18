import 'package:egreenbin/app/core/extensions/date_ex.dart';
import 'package:egreenbin/app/core/theme/app_colors.dart';
import 'package:egreenbin/app/core/theme/text_styles.dart';
import 'package:egreenbin/app/data/models/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class CardComment extends StatelessWidget {
  Comment comment;
  Function deleteComment;
  CardComment(this.comment, this.deleteComment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
// card comment
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 13),
// content
              Slidable(
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        // delete comment
                        deleteComment();
                      },
                      icon: Icons.delete,
                      backgroundColor: AppColors.wrong,
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 12, left: 10, right: 10, bottom: 10),
                  decoration: const BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow,
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text(
                    comment.content,
                    style: CustomTextStyle.b3(AppColors.subtle_1),
                  ),
                ),
              ),
// date create
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 10, right: 10, bottom: 10),
                child: Text(
                  comment.dateCreate!.dayBeforeString,
                  style: CustomTextStyle.b8(AppColors.subtle_2),
                ),
              ),
            ],
          ),
        ),
// card date
        Positioned(
          top: 0,
          left: 22,
          child: Container(
            width: 80,
            height: 20,
            decoration: const BoxDecoration(
              color: AppColors.normal,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Center(
              child: Text(
                comment.dateSort!.toString(),
                style: CustomTextStyle.b8(AppColors.surface),
              ),
            ),
          ),
        )
      ],
    );
  }
}
