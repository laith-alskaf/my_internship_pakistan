import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text_field.dart';

class ColumnField extends StatelessWidget {
  const ColumnField(
      {super.key,
      required this.title,
      required this.controller,
      required this.hintText,
      this.validator});

  final String title;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          bottomPadding: 15.h,
          text: title,
          textType: TextStyleType.bodyBig,
          textColor: AppColors.mainColor,
          fontWeight: FontWeight.normal,
        ),
        CustomTextFormField(
          colorBorder: AppColors.mainColor,
          hintText: hintText,
          controller: controller,
          validator: validator,
        ),
      ],
    );
  }
}
