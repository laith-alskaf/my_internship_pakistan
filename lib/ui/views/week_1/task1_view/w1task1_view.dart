import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_button.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_scaffold_task.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';
import 'package:internship_pakistan/ui/shared/extension_sizebox.dart';
import 'package:internship_pakistan/ui/views/week_1/task1_view/w1task1_controller.dart';

class W1Task1View extends StatelessWidget {
  const W1Task1View({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<W1Task1Controller>(
        init: W1Task1Controller(),
        builder: (controller) {
          return CustomScaffoldTask(
            title: title,
            taskNumber: '1',
            children: [
              (0.26.sh).ph,
              ZoomIn(
                child: IntrinsicWidth(
                  child: Container(
                    padding: EdgeInsets.all(20.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.r)),
                        border:
                            Border.all(color: AppColors.mainColor, width: 5.w)),
                    child: CustomText(
                      textColor: AppColors.redColor,
                      textType: TextStyleType.title,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 35.sp,
                      text: controller.counter.toString(),
                    ),
                  ),
                ),
              ),
              (50.h).ph,
              ZoomIn(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: '--',
                      buttonTypeEnum: ButtonTypeEnum.normal,
                      fontSize: 33.sp,
                      height: 60.h,
                      onPressed: () {
                        controller.changeCounterValue(increase: false);
                      },
                    ),
                    (80.w).pw,
                    CustomButton(
                      text: '+',
                      buttonTypeEnum: ButtonTypeEnum.normal,
                      fontSize: 33.sp,
                      height: 60.h,
                      onPressed: () {
                        controller.changeCounterValue(increase: true);
                      },
                    ),
                  ],
                ),
              ),
              (50.h).ph,
              ZoomIn(
                child: CustomButton(
                  backgroundColor: AppColors.whiteColor,
                  text: 'C',
                  textColor: AppColors.blackColor,
                  buttonTypeEnum: ButtonTypeEnum.normal,
                  fontSize: 30.sp,
                  width: 100.w,
                  onPressed: () {
                    controller.counter = 0;
                    controller.update();
                  },
                ),
              ),
            ],
          );
        });
  }
}
