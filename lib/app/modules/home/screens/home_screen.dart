import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/global_widgets/home_appbar.dart';
import 'package:egreenbin/app/modules/home/widgets/card_danh_sach_lop.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // appbar
          HomeAppbar(),
          const SizedBox(height: 15),
          // card has list student
          CardDSLop(),
          // button refresh
        ],
      ),
    );
  }
}
