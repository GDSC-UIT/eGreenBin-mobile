import 'package:egreenbin/app/core/values/app_colors.dart';
import 'package:egreenbin/app/core/values/text_styles.dart';
import 'package:egreenbin/app/data/models/comment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/values/app_values.dart';

class CardComment extends StatelessWidget {
  Comment comment;

  CardComment(this.comment);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 13),
              Container(
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
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 10, right: 10, bottom: 10),
                child: Text(
                  "1 ngày trước",
                  style: CustomTextStyle.b8(AppColors.subtle_2),
                ),
              ),
            ],
          ),
        ),
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
                DateFormat(FormatValue.numbericDateFormat)
                    .format(comment.date!),
                style: CustomTextStyle.b8(AppColors.surface),
              ),
            ),
          ),
        )
      ],
    );
  }
}
