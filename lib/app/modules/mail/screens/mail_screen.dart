import 'package:egreenbin/app/modules/mail/mail_controller.dart';
import 'package:egreenbin/app/modules/mail/widgets/card_students_mail_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/assets_image.dart';
import '../../../core/values/text_styles.dart';
import '../../../global_widgets/appbar_teacher.dart';

class MailScreen extends StatelessWidget {
  final MailController _controller = Get.find<MailController>();

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
                    "THƯ ĐIỆN TỬ",
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
                  onTap: () => _controller.sendMailToAll(),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 20,
                          child: Image.asset(Assets.mail),
                        ),
                        Text(
                          "Gửi tất cả",
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
