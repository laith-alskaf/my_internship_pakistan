import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';
import 'package:internship_pakistan/ui/views/week_4/task1_view/w4task1_controller.dart';

// ignore: must_be_immutable
class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
    required this.controller,
    required this.hintText,
    this.width,
    this.fillColor,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.height,
    required this.pickFirst,
    this.contentPadding,
  });

  final W4task1Controller controller;
  final String hintText;
  final double? width;
  final double? height;
  final Color? fillColor;
  final DateTime? initialDate;
  final EdgeInsetsDirectional? contentPadding;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool pickFirst;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pickFirst == true
          ? () async {
              final selectedDate = await showDatePicker(
                context: Get.context!,
                initialDate: initialDate ?? DateTime.now(),
                firstDate: firstDate ?? DateTime(1960),
                lastDate: lastDate ?? DateTime(2028),
              );
              if (selectedDate != null) {
                controller.selectDeadLine =
                    selectedDate.toString().substring(0, 10);
                controller.update();
              }
            }
          : () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: fillColor ?? AppColors.grayColor,
        ),
        height: height ?? 0.065.sh,
        width: width ?? 0.51.sw,
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: 0.01.sw, vertical: 0.02.sh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: controller.selectDeadLine == ''
                    ? hintText
                    : controller.selectDeadLine,
                textColor: controller.selectDeadLine == ''
                    ? AppColors.grayColor
                    : AppColors.whiteColor,
                textType: TextStyleType.body,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
