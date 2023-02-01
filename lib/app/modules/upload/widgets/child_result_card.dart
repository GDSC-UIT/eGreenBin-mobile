import 'package:egreenbin/app/core/extensions/buildcontext_ex.dart';
import 'package:egreenbin/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/values/assets_image.dart';

class ChildResultCard extends StatelessWidget {
  const ChildResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
// backround
          Container(
              height: context.screenSize.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.backround), fit: BoxFit.fill),
              ),
// card
              child: Center(
                child: Container(
                  height: context.screenSize.height,
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
                        "STATISTICS".tr,
                        style: CustomTextStyle.h2(AppColors.primary1),
                      ),
                      const SizedBox(height: 5),
                      // static
                      // dung sai
                      // bieu do

                      //II. SPECIFIC DATA
                      // two face
                      // process bar
                      // text

                      //III. COMMENT
                      // list comment

                      // logo
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
