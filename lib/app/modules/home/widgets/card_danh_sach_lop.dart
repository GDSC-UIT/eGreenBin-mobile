import 'package:egreenbin/app/core/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/values/app_colors.dart';

class CardDSLop extends StatefulWidget {
  static const menuItems = <String>['Mầm C1', 'Mầm C2', 'Mầm C3'];

  @override
  State<CardDSLop> createState() => _CardDSLopState();
}

class _CardDSLopState extends State<CardDSLop> {
  // class value
  final int numberOfStudent = 32;

  // dropButton value
  final List<DropdownMenuItem<String>> _dropDownMenuItems = CardDSLop.menuItems
      .map(
        (value) => DropdownMenuItem(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  String _selectedDefault = "Mầm C2";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.Surface,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
// danh sach lop
                const SizedBox(height: 38),
                Text(
                  "DANH SÁCH LỚP",
                  style: CustomTextStyle.h2(AppColors.Primary1),
                ),
                const SizedBox(height: 2),
                Text(
                  "${numberOfStudent} học sinh",
                  style: CustomTextStyle.b1(AppColors.Subtle_1),
                ),
// loc theo

// list student
              ],
            ),
          ),
// dropbutton
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: 30,
              padding: const EdgeInsets.only(left: 10, right: 5),
              decoration: const BoxDecoration(
                color: AppColors.Normal,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: DropdownButton<String>(
                style: CustomTextStyle.b2(AppColors.Surface),
                dropdownColor: AppColors.Normal,
                value: _selectedDefault,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDefault = newValue!;
                  });
                },
                items: _dropDownMenuItems,
                underline: Container(color: AppColors.Normal),
                icon: const Icon(
                  Icons.expand_more,
                  size: 25,
                  color: AppColors.Surface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
