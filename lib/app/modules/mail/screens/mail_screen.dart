import 'package:egreenbin/app/modules/mail/mail_controller.dart';
import 'package:egreenbin/app/modules/mail/widgets/card_students_mail_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/values/assets_image.dart';
import '../../../core/theme/text_styles.dart';
import '../../../global_widgets/appbar_teacher.dart';

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

  Future<void> captureScreen() async {
    _controller.image = await _controller.screenshotController.capture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.backround), fit: BoxFit.fill),
          ),
          child: Stack(
            children: [
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
                  Screenshot(
                    controller: _controller.screenshotController,
                    child: CardStudentMailList(_controller),
                  ),
                ],
              ),
// button right bottom
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () async {
                    await captureScreen();
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
