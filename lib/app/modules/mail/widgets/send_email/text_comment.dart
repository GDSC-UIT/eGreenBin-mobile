import 'package:egreenbin/app/data/models/comment.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class TextComment extends StatelessWidget {
  Comment comment;
  TextComment(this.comment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Text(
        "- ${comment.content}",
        //style: CustomTextStyle.b3(AppColors.subtle_1),
      ),
    );
  }
}
