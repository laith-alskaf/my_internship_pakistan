import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_scaffold_task.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';
import 'package:internship_pakistan/ui/shared/extension_sizebox.dart';
import 'package:internship_pakistan/ui/views/week_4/task1_view/w3task1_widget/custom_info_task.dart';
import 'package:internship_pakistan/ui/views/week_4/task1_view/w3task1_widget/dialog_action_task.dart';
import 'package:internship_pakistan/ui/views/week_4/task1_view/w4task1_controller.dart';

class W4task1View extends StatelessWidget {
  const W4task1View({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<W4task1Controller>(
        init: W4task1Controller(),
        builder: (controller) {
          return GestureDetector(
            onTap: () {
              controller.showActionTask = false;
              controller.indexTaskShowAction = -1;
              controller.update();
            },
            child: CustomScaffoldTask(
                taskNumber: '1',
                title: title,
                floatingActionButton: GestureDetector(
                  onTap: () {
                    controller.stateController = '';
                    controller.descriptionController.clear();
                    controller.titleController.clear();
                    controller.selectDeadLine = '';
                    showDialogActionTask(controller: controller, isAdd: true);
                  },
                  child: Container(
                      height: 80.w,
                      width: 80.w,
                      decoration: BoxDecoration(
                          color: AppColors.mainColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Icon(
                        Icons.add_outlined,
                        size: 40.w,
                      )),
                ),
                children: [
                  (20.h).ph,
                  FadeInDown(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      height: 70.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.r),
                              topRight: Radius.circular(15.r)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.mainColor.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(-1, -1),
                            ),
                          ]),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.handleChangeFilterTask(filter: 'All');
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 125.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                  color: controller.filterTask == 'All'
                                      ? AppColors.whiteColor
                                      : AppColors.mainColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.r))),
                              child: CustomText(
                                text: 'All',
                                textType: TextStyleType.body,
                                fontWeight: FontWeight.bold,
                                textColor: controller.filterTask == 'All'
                                    ? AppColors.blackColor
                                    : AppColors.whiteColor,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.handleChangeFilterTask(
                                  filter: 'To Do');
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 125.w,
                              height: 100.h,
                              color: controller.filterTask == 'To Do'
                                  ? AppColors.whiteColor
                                  : Colors.blue,
                              child: CustomText(
                                text: 'To Do',
                                textType: TextStyleType.body,
                                fontWeight: FontWeight.bold,
                                textColor: controller.filterTask == 'To Do'
                                    ? AppColors.blackColor
                                    : AppColors.whiteColor,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.handleChangeFilterTask(
                                  filter: 'Processing');
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 125.w,
                              color: controller.filterTask == 'Processing'
                                  ? AppColors.whiteColor
                                  : AppColors.redColor,
                              height: 100.h,
                              child: CustomText(
                                text: 'Processing',
                                textType: TextStyleType.body,
                                fontWeight: FontWeight.bold,
                                textColor: controller.filterTask == 'Processing'
                                    ? AppColors.blackColor
                                    : AppColors.whiteColor,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.handleChangeFilterTask(
                                  filter: 'Finished');
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 125.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                  color: controller.filterTask == 'Finished'
                                      ? AppColors.whiteColor
                                      : Colors.yellow,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15.r))),
                              child: CustomText(
                                text: 'Finished',
                                textType: TextStyleType.body,
                                fontWeight: FontWeight.bold,
                                textColor: controller.filterTask == 'Finished'
                                    ? AppColors.blackColor
                                    : AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    height: controller.expandContainer ? 0.55.sh : 0,
                    width: 1.sw,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15.r),
                            bottomLeft: Radius.circular(15.r)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.mainColor.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 4),
                          ),
                        ]),
                    child: controller.expandContainer
                        ? Scrollbar(
                            child: Obx(() => controller.showTasks.isEmpty
                                ? ZoomIn(
                                    delay: const Duration(milliseconds: 600),
                                    child: const Center(
                                      child: CustomText(
                                        text: 'No task to show',
                                        textType: TextStyleType.title,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : ListView(
                                    children: List.generate(
                                        controller.showTasks.length, (index) {
                                    return ZoomIn(
                                      delay: Duration(
                                          milliseconds: index * 100 + 400),
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: CustomInfoTask(
                                        index: index,
                                        controller: controller,
                                        taskToDo: controller.showTasks[index],
                                      ),
                                    );
                                  }))))
                        : const SizedBox(),
                  )
                ]),
          );
        });
  }
}
