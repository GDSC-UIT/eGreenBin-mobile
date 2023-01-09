import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/core/values/text_styles.dart';
import 'package:egreenbin/app/data/models/comment.dart';
import 'package:egreenbin/app/global_widgets/card_comment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../core/values/app_colors.dart';

class CardEvaluate extends StatefulWidget {
  List<Comment> comments;
  double heightOfBox;
  CardEvaluate(this.comments, this.heightOfBox);

  // dropButton sort value
  static List<String> sortItems = [
    "Mới nhất",
    "Cũ nhất",
  ];

  @override
  State<CardEvaluate> createState() => _CardEvaluateState();
}

class _CardEvaluateState extends State<CardEvaluate> {
  String sortSelected = CardEvaluate.sortItems[0];

  final List<DropdownMenuItem<String>> _sortMenuItems = CardEvaluate.sortItems
      .map(
        (value) => DropdownMenuItem(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Container(
            height: widget.heightOfBox,
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
                            child: DropdownButton<String>(
                              style: CustomTextStyle.b3(AppColors.Normal),
                              dropdownColor: AppColors.PrimarySubtle2,
                              value: sortSelected,
                              onChanged: (String? newValue) {
                                setState(() {
                                  sortSelected = newValue!;
                                });
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
                      ],
                    ),
                  ],
                ),
// list comment
                const SizedBox(height: 5),
                Expanded(
                  child: Container(
                    child: widget.comments.length == 0
                        ? Center(
                            child: Text(
                              "CHƯA CÓ ĐÁNH GIÁ NÀO",
                              style: CustomTextStyle.h2(AppColors.Normal),
                            ),
                          )
                        : ListView.builder(
                            itemCount: widget.comments.length,
                            itemBuilder: (context, index) =>
                                CardComment(widget.comments[index]),
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
              onTap: () {},
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
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
