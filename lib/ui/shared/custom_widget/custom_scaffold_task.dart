import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';

class CustomScaffoldTask extends StatelessWidget {
  const CustomScaffoldTask(
      {super.key,
      required this.title,
      required this.taskNumber,
      required this.children});

  final String title;
  final String taskNumber;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.whiteColor,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                backgroundColor: AppColors.mainColor,
                centerTitle: true,
                leading: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.whiteColor,
                      size: 30.w,
                    )),
                title: CustomText(
                  textColor: AppColors.whiteColor,
                  textType: TextStyleType.title,
                  fontWeight: FontWeight.bold,
                  text: 'Task-$taskNumber-',
                )),
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
              child: Column(
                children: [
                  CustomText(
                    topPadding: 20.h,
                    textColor: AppColors.mainColor,
                    textType: TextStyleType.title,
                    fontSize: 35.sp,
                    fontWeight: FontWeight.bold,
                    text: title,
                  ),
                  ...children
                ],
              ),
            )));
  }
}
