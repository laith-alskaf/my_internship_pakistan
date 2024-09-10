import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/models/info_model.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_scaffold_task.dart';
import 'package:internship_pakistan/ui/shared/extension_sizebox.dart';
import 'package:internship_pakistan/ui/views/week_1/task1_view/w1task1_controller.dart';
import 'package:internship_pakistan/ui/views/week_1/task2_view/summary_view/custom_row_info.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({super.key, required this.info});

  final InfoModel info;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<W1Task1Controller>(
        init: W1Task1Controller(),
        builder: (controller) {
          return CustomScaffoldTask(
            title: 'Summary Screen',
            taskNumber: '2',
            children: [
              (20.h).ph,
              ZoomIn(
                child: Container(
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
                      CustomRowInfo(
                        title: 'Name: ',
                        value: info.name,
                      ),
                      (20.h).ph,
                      CustomRowInfo(
                        title: 'Email: ',
                        value: info.email,
                      ),
                      (20.h).ph,
                      CustomRowInfo(
                        title: 'Message: ',
                        value: info.message,
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }
}
