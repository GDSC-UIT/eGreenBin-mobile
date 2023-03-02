import 'package:egreenbin/app/core/theme/text_styles.dart';
import 'package:egreenbin/app/data/providers/students.dart';
import 'package:egreenbin/app/global_widgets/shimmer_list.dart';
import 'package:egreenbin/app/global_widgets/sort_box.dart';
import 'package:egreenbin/app/modules/home/home_controller.dart';
import 'package:egreenbin/app/modules/home/widgets/card_student.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';

class CardStudentList extends StatelessWidget {
  final HomeController _controller;

  const CardStudentList(this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    // build UI
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: double.infinity,
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
            child: Column(
              children: [
// danh sach lop
                const SizedBox(height: 38),
                Text(
                  "CLASS LIST".tr,
                  style: CustomTextStyle.h2(AppColors.primary1),
                ),
                const SizedBox(height: 2),
                Text(
                  "${_controller.numberOfStudent.value} ${"students".tr}",
                  style: CustomTextStyle.b1(AppColors.subtle_1),
                ),
                const SizedBox(height: 5),
// loc theo
                Row(
                  children: [
                    const SizedBox(width: 21),
                    Obx(
                      () => SortBox(
                        textTitle: "Filter by".tr,
                        sortService: _controller.sortService!.value,
                      ),
                    ),
                  ],
                ),
// list student
                const SizedBox(height: 10),
                Obx(() => Expanded(
                      child: _controller.isLoading.value
                          ? const ShimmerList()
                          : ListView.builder(
                              padding: const EdgeInsets.all(0),
                              itemCount: Students.listStudents.length,
                              itemBuilder: (context, i) => StudentCard(
                                i + 1,
                                Students.listStudents[i],
                                _controller.pushToStudentInfoScreen,
                              ),
                            ),
                    )),
                const SizedBox(height: 10),
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
                color: AppColors.normal,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Obx(
                () => DropdownButton<String>(
                  style: CustomTextStyle.b2(AppColors.surface),
                  dropdownColor: AppColors.normal,
                  value: _controller.sortService!.value.selectedClass.value,
                  onChanged: (String? newValue) {
                    _controller.sortService!.value.changeClassItem(newValue!);
                  },
                  items: _controller.sortService!.value.dropdownClassItems,
                  underline: Container(color: AppColors.normal),
                  icon: const Icon(
                    Icons.expand_more,
                    size: 25,
                    color: AppColors.surface,
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
