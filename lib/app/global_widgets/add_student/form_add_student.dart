import 'package:egreenbin/app/core/extensions/double_ex.dart';
import 'package:egreenbin/app/core/extensions/string_ex.dart';
import 'package:egreenbin/app/global_widgets/add_student/image_avatar_picker.dart';
import 'package:egreenbin/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/text_styles.dart';

class FormAddStudent extends StatefulWidget {
  HomeController controller;
  FormAddStudent(this.controller);

  @override
  State<FormAddStudent> createState() => _FormAddStudentState();
}

class _FormAddStudentState extends State<FormAddStudent> {
  final _formKey = GlobalKey<FormState>();
  final _codeFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();

  @override
  void dispose() {
    _codeFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          ImageAvatarPicker(),
          SizedBox(height: 2.0.hp),
// name of student
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name".tr,
                style: CustomTextStyle.b2(AppColors.subtle_1),
              ),
              const SizedBox(height: 7),
              TextFormField(
                key: const ValueKey('name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name.';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  //_userEmail = newValue!;
                },
                onFieldSubmitted: (_) {
                  // chuyen qua textfill tiep theo
                  FocusScope.of(context).requestFocus(_codeFocusNode);
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                style: CustomTextStyle.b7(AppColors.subtle_1),
                maxLines: 1,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary1, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: "Full name".tr,
                ),
              ),
            ],
          ),
          SizedBox(height: 1.5.hp),
// name of code
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CodeStudent".tr,
                style: CustomTextStyle.b2(AppColors.subtle_1),
              ),
              const SizedBox(height: 7),
              TextFormField(
                key: const ValueKey('code'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a code.'.tr;
                  } else if (!value.isNumeric()) {
                    return "Code is a number.".tr;
                  }
                  return null;
                },
                onSaved: (newValue) {
                  //_userEmail = newValue!;
                },
                onFieldSubmitted: (_) {
                  // chuyen qua textfill tiep theo
                  FocusScope.of(context).requestFocus(_emailFocusNode);
                },
                textInputAction: TextInputAction.next,
                focusNode: _codeFocusNode,
                keyboardType: TextInputType.number,
                style: CustomTextStyle.b7(AppColors.subtle_1),
                maxLines: 1,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary1, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: "Code".tr,
                ),
              ),
            ],
          ),
          SizedBox(height: 1.5.hp),
// email of student
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Parent's email".tr,
                style: CustomTextStyle.b2(AppColors.subtle_1),
              ),
              const SizedBox(height: 7),
              TextFormField(
                key: const ValueKey('email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a valid email address.';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  //_userEmail = newValue!;
                },
                focusNode: _emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                style: CustomTextStyle.b7(AppColors.subtle_1),
                maxLines: 1,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary1, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: "Email".tr,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
