import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';
import 'package:internship_pakistan/ui/views/tasks_view/tasks_controller.dart';
import 'package:internship_pakistan/ui/views/tasks_view/tasks_widget/container_task.dart';
import 'package:internship_pakistan/ui/views/tasks_view/tasks_widget/container_week.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: SafeArea(
            child: GetBuilder<TasksController>(
          init: TasksController(),
          builder: (controller) {
            return Scaffold(
                appBar: AppBar(
                    backgroundColor: AppColors.mainColor,
                    centerTitle: true,
                    leading: controller.currentWeek == -1
                        ? null
                        : GestureDetector(
                            onTap: () {
                              controller.currentWeek = -1;
                              controller.update();
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
                      text: controller.currentWeek == -1
                          ? 'Weeks'
                          : 'Week-${controller.currentWeek.toString()}-',
                    )),
                backgroundColor: AppColors.whiteColor,
                body: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Wrap(
                          spacing: 30.w,
                          runSpacing: 30.w,
                          children: controller.currentWeek == -1
                              ? List.generate(controller.weekTask.length,
                                  (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      controller.handleClickWeek(index: index);
                                    },
                                    child: ContainerWeek(
                                      week:
                                          controller.weekTask[index].numberWeek,
                                    ),
                                  );
                                })
                              : List.generate(
                                  controller.weekTask[controller.currentWeek]
                                      .tasks.length, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      controller
                                          .weekTask[controller.currentWeek]
                                          .tasks[index]
                                          .goTo();
                                    },
                                    child: ContainerTask(
                                      task: controller
                                          .weekTask[controller.currentWeek]
                                          .tasks[index],
                                    ),
                                  );
                                })),
                    ),
                  ),
                ));
          },
        )));
  }
}
