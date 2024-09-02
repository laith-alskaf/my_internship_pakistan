import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_button.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_scaffold_task.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';
import 'package:internship_pakistan/ui/shared/extension_sizebox.dart';
import 'package:internship_pakistan/ui/shared/utils.dart';
import 'package:internship_pakistan/ui/views/week_1/task2_view/task2_controller.dart';
import 'package:internship_pakistan/ui/views/week_1/task2_view/task2_widget/column_field.dart';

class Task2View extends StatelessWidget {
  const Task2View({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Task2Controller>(
        init: Task2Controller(),
        builder: (controller) {
          return CustomScaffoldTask(
            title: title,
            taskNumber: '2',
            children: [
              Form(
                key: controller.formKey,
                child: ZoomIn(
                  duration: const Duration(milliseconds: 500),
                  child: Column(
                    children: [
                      (20.h).ph,
                      ColumnField(
                        title: 'Name',
                        controller: controller.name,
                        hintText: 'Laith Alskaf',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please input your name';
                          }
                          return null;
                        },
                      ),
                      (20.h).ph,
                      ColumnField(
                        title: 'Email',
                        controller: controller.email,
                        hintText: 'liethmhmad231@gmail.com',
                        validator: (value) {
                          if (value!.isEmpty || !isEmail(value)) {
                            return 'please check your email';
                          }
                          return null;
                        },
                      ),
                      (20.h).ph,
                      ColumnField(
                        title: 'Message',
                        controller: controller.message,
                        hintText: 'Hi,Iam Senior Flutter Developer',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please input your message';
                          }
                          return null;
                        },
                      ),
                      (50.h).ph,
                      controller.loading
                          ? SpinKitCircle(
                              color: AppColors.mainColor,
                              size: 80.w,
                            )
                          : CustomButton(
                              text: 'Submit',
                              buttonTypeEnum: ButtonTypeEnum.big,
                              height: 50.h,
                              fontSize: 30.sp,
                              onPressed: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.loading = true;
                                  controller.update();
                                  Future.delayed(const Duration(seconds: 2))
                                      .then((value) {
                                    controller.handleSubmitInfo();

                                  });
                                }
                              },
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
