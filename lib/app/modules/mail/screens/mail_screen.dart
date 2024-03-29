import 'package:egreenbin/app/core/extensions/buildcontext_ex.dart';
import 'package:egreenbin/app/modules/mail/mail_controller.dart';
import 'package:egreenbin/app/modules/mail/widgets/card_students_mail_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/values/assets_image.dart';
import '../../../core/theme/text_styles.dart';
import '../../../global_widgets/appbar_teacher.dart';
import '../widgets/send_email/child_result_card.dart';

class MailScreen extends StatefulWidget {
  const MailScreen({super.key});

  @override
  State<MailScreen> createState() => _MailScreenState();
}

class _MailScreenState extends State<MailScreen> {
  final MailController _controller = Get.find<MailController>();

  // loading when send all
  bool isLoading = false;
  void sendEmail() {
    setState(() {
      isLoading = true;
    });
    _controller.sendMailToAll().then(
      (_) {
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // card gui cho phu huynh
              ChildResultCard(_controller.testMail!.student.id!,
                  _controller.screenshotController),
              // backround che di card dang sau
              Container(
                height: context.screenSize.height,
                color: AppColors.primarySubtle2,
              ),
              SizedBox(
                height: context.screenSize.height,
                width: double.infinity,
                child: Image.asset(
                  Assets.backround,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
// appbar
                  AppbarTeacher(
                    "MAILS".tr,
                    _controller.teacher.value,
                    _controller.popToPrevScreen,
                    Image.asset(Assets.back),
                  ),
                  const SizedBox(height: 15),
// card has list student
                  CardStudentMailList(_controller),
                ],
              ),
// button right bottom
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () async {
                    sendEmail();
                  },
                  child: Container(
                    height: 44,
                    width: 123,
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    decoration: const BoxDecoration(
                      color: AppColors.normal,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: isLoading
                        ? const Center(
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: AppColors.surface,
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 20,
                                child: Image.asset(Assets.mail),
                              ),
                              Text(
                                "Send all".tr,
                                style: CustomTextStyle.b7(AppColors.surface),
                              )
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
