import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/ui/models/info_model.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_button.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_scaffold_task.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';
import 'package:internship_pakistan/ui/shared/extension_sizebox.dart';
import 'package:internship_pakistan/ui/views/week_1/task1_view/task1_controller.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({super.key, required this.info});

  final InfoModel info;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Task1Controller>(
        init: Task1Controller(),
        builder: (controller) {
          return CustomScaffoldTask(
            title: 'Summary Screen',
            taskNumber: '2',
            children: [
              (20.h).ph,
              Container(
                padding: EdgeInsets.all(30.w),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Name: ',
                          textType: TextStyleType.bodyBig,
                          textColor: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: 330.w,
                          child: CustomText(
                            text: info.name,
                            textType: TextStyleType.bodyBig,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    (20.h).ph,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Email: ',
                          textType: TextStyleType.bodyBig,
                          textColor: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: 330.w,
                          child: CustomText(
                            text: info.email,
                            textType: TextStyleType.bodyBig,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    (20.h).ph,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Message: ',
                          textType: TextStyleType.bodyBig,
                          textColor: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: 330.w,
                          child: CustomText(
                            text: info.message,
                            textType: TextStyleType.bodyBig,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
