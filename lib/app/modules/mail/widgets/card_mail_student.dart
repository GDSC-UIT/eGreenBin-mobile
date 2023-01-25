import 'package:auto_size_text/auto_size_text.dart';
import 'package:egreenbin/app/core/values/app_colors.dart';
import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/core/values/text_styles.dart';
import 'package:egreenbin/app/data/models/student.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// ignore: must_be_immutable
class CardMailStudent extends StatefulWidget {
  int index = 0;
  Student student;
  Function showDialog;
  CardMailStudent(this.index, this.student, this.showDialog, {super.key});

  @override
  State<CardMailStudent> createState() => _CardMailStudentState();
}

class _CardMailStudentState extends State<CardMailStudent> {
  String get indexFormat {
    if (widget.index < 10) return '0${widget.index}';
    return '${widget.index}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primarySubtle2,
      elevation: 0,
      child: Row(
        children: [
// num
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 5),
            child: SizedBox(
              width: 30,
              child: Text(
                indexFormat,
                style: CustomTextStyle.b4(AppColors.normal),
              ),
            ),
          ),
//avatar
          CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.background,
            child: widget.student.imageAvartaUrl == null
                ? const Icon(
                    Icons.person,
                    color: AppColors.subtle_2,
                  )
                : Image.network(widget.student.imageAvartaUrl!),
          ),
// column
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  widget.student.name,
                  style: CustomTextStyle.b1(AppColors.primary1),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 200,
                child: AutoSizeText(
                  widget.student.parentEmail!,
                  style: CustomTextStyle.b1(AppColors.subtle_2),
                  maxLines: 1,
                  minFontSize: 5,
                ),
              ),
            ],
          ),
// star
          ZoomTapAnimation(
            onTap: () {
              widget.showDialog(context, widget.student);
            },
            child: SizedBox(
              height: 30,
              child: Image.asset(
                widget.student.isNote! ? Assets.yellowStar : Assets.greyStar,
              ),
            ),
          )
        ],
      ),
    );
  }
}
