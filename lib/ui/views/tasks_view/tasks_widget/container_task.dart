import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_pakistan/models/task_model.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';
import 'package:internship_pakistan/ui/shared/extension_sizebox.dart';

class ContainerTask extends StatelessWidget {
  const ContainerTask({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
        child: Container(
      padding: EdgeInsets.all(10.w),
      height: 200.w,
      width: 200.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.mainColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: task.id.toString(),
            textType: TextStyleType.subtitle,
            textColor: AppColors.mainColor,
            fontWeight: FontWeight.bold,
          ),
          (20.h).ph,
          CustomText(
            text: task.title,
            textType: TextStyleType.body,
            isTextAlign: TextAlign.center,
          ),
          // const Spacer(),
          if (task.done != null) ...[
            (20.h).ph,
            const CustomText(
              text: 'Done',
              textType: TextStyleType.body,
              textColor: AppColors.greenColor,
            )
          ]
        ],
      ),
    ));
  }
}
