import 'package:egreenbin/app/modules/mail/widgets/send_email/text_comment.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../data/models/comment.dart';

// ignore: must_be_immutable
class Evaluate extends StatelessWidget {
  List<Comment> listComment;
  Evaluate(this.listComment, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
// text
        Row(
          children: [
            const SizedBox(width: 20),
            Text(
              "III. " "COMMENTS".tr,
              style: CustomTextStyle.h2(AppColors.normal),
            ),
          ],
        ),
// list comment
        const SizedBox(height: 2),
        ListView.builder(
          shrinkWrap: true,
          itemCount: listComment.length,
          itemBuilder: (context, i) => TextComment(listComment[i]),
        )
      ],
    );
  }
}
