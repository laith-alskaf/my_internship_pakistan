import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';

class CustomScaffoldTask extends StatelessWidget {
  const CustomScaffoldTask(
      {super.key,
      required this.title,
       this.taskNumber,
      required this.children,
      this.floatingActionButton,
      this.onTap,
      this.titleAppbar});

  final String title;
  final String? titleAppbar;
  final Function()? onTap;
  final String? taskNumber;
  final List<Widget> children;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            floatingActionButton: floatingActionButton,
            backgroundColor: AppColors.whiteColor,
            appBar: AppBar(
                backgroundColor: AppColors.mainColor,
                centerTitle: true,
                leading: GestureDetector(
                    onTap: onTap ??
                        () {
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
                  text:titleAppbar?? 'Task-$taskNumber-',
                )),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  if (title != '')
                    CustomText(
                      isTextAlign: TextAlign.center,
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
