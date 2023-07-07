import 'package:egreenbin/app/modules/student_info/widgets/table_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../global_widgets/sort_box.dart';
import '../student_info_controller.dart';

class CardTableResult extends StatelessWidget {
  final StudentInfoController _controller;
  const CardTableResult(this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
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
// loc theo
                const SizedBox(height: 30),
                Row(
                  children: [
                    const SizedBox(width: 21),
                    Obx(
                      () => SortBox(
                        textTitle: "Filter by".tr,
                        sortService: _controller.sortCardEvaluate!.value,
                      ),
                    ),
                  ],
                ),
// list comment
                // table here
                Obx(
                  () => Expanded(
                    child: Container(
                      child: _controller.listResultCell.isEmpty
                          ? Center(
                              child: Text(
                                "THERE ARE NO DATA YET".tr,
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.h2(AppColors.normal),
                              ),
                            )
                          : TableResult(_controller.listResultCell),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
