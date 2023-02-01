import '../../../../core/values/app_strings.dart';
import '../../../../data/models/comment.dart';
import 'package:egreenbin/app/core/theme/app_colors.dart';
import 'package:egreenbin/app/modules/mail/widgets/send_email/evaluate.dart';
import 'package:egreenbin/app/modules/mail/widgets/send_email/ratio.dart';
import 'package:egreenbin/app/modules/mail/widgets/send_email/statistical.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/values/assets_image.dart';
import '../../../../data/models/student.dart';
import '../../../../data/providers/comments.dart';
import '../../../../data/providers/students.dart';

// ignore: must_be_immutable
class ChildResultCard extends StatelessWidget {
  // id of student
  String id;
  ChildResultCard(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    Student student = Students.findStudent(id);
    List<Comment> listComment = Comments.listCommentsFindById(id);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // backround
              Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Assets.backround), fit: BoxFit.fill),
                  ),
                  // card
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(20),
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
                      // content
                      child: Column(
                        children: [
                          // title
                          const SizedBox(height: 20),
                          Text(
                            "YOUR CHILD'S TRAINING RESULT".tr,
                            style: CustomTextStyle.h2(AppColors.primary1),
                          ),
                          const SizedBox(height: 20),
                          // I. STATISTICS
                          Statistical(student),
                          const SizedBox(height: 10),
                          //II. SPECIFIC DATA
                          Ratio(student),
                          const SizedBox(height: 20),
                          //III. COMMENT
                          Evaluate(listComment),
                          // logo
                          // Image logo and app name
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              SizedBox(
                                height: 200,
                                child: Image.asset(Assets.logo),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Column(
                                  children: [
                                    Text(
                                      AppStrings.appName,
                                      style:
                                          CustomTextStyle.h4(AppColors.normal),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      "from GDSC UIT".tr,
                                      style: CustomTextStyle.b3(
                                          AppColors.primarySubtle1),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
