import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';

class CustomRowInfo extends StatelessWidget {
  const CustomRowInfo({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          textType: TextStyleType.bodyBig,
          textColor: AppColors.mainColor,
        ),
        SizedBox(
          width: 330.w,
          child: CustomText(
            text:value,
            textType: TextStyleType.bodyBig,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
