import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/values/assets_image.dart';
import '../../../data/models/result_cell.dart';

class TableResult extends StatelessWidget {
  List<ResultCell> listResultCell;
  TableResult(this.listResultCell, {super.key});
  DataRow getDataCell(ResultCell cell) {
    return DataRow(
      cells: <DataCell>[
        DataCell(
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                  child: Image.asset(
                    cell.isHappy! ? Assets.btnFaceHappy : Assets.btnFaceSad,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '${cell.name}',
                  style: CustomTextStyle.b1(AppColors.subtle_1),
                ),
              ],
            ),
          ),
        ),
        DataCell(
          Align(
            alignment: Alignment.center,
            child: Text(
              '${cell.right}',
              style: CustomTextStyle.b1(AppColors.subtle_1),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        DataCell(
          Align(
            alignment: Alignment.center,
            child: Text(
              '${cell.wrong}',
              style: CustomTextStyle.b1(AppColors.subtle_1),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
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
      child: SingleChildScrollView(
        child: DataTable(
          border: TableBorder(
            verticalInside: BorderSide(
              width: 0.7,
              color: Colors.grey.shade300,
            ),
          ),
          dividerThickness: 0.7,
          dataRowHeight: 40,
          headingRowHeight: 40,
          columnSpacing: 50,
          columns: <DataColumn>[
            const DataColumn(
              label: Expanded(
                child: Text(""),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Right'.tr,
                  style: CustomTextStyle.b15(AppColors.normal),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Wrong'.tr,
                  style: CustomTextStyle.b15(AppColors.wrong),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
          rows: listResultCell.map((cell) => getDataCell(cell)).toList(),
        ),
      ),
    );
  }
}
