import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/global_widgets/home_appbar.dart';
import 'package:egreenbin/app/modules/home/widgets/card_danh_sach_lop.dart';
import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // appbar
              HomeAppbar(),
              const SizedBox(height: 15),
              // card has list student
              CardDSLop(),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                //refresh
              },
              child: Container(
                height: 44,
                width: 123,
                padding: const EdgeInsets.only(left: 10, right: 5),
                decoration: const BoxDecoration(
                  color: AppColors.Normal,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Tải mới",
                    style: CustomTextStyle.b6(AppColors.Surface),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
