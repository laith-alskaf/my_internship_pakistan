import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_pakistan/models/to_do_model.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';
import 'package:internship_pakistan/ui/shared/extension_sizebox.dart';
import 'package:internship_pakistan/ui/views/week_4/task1_view/w3task1_widget/dialog_action_task.dart';
import 'package:internship_pakistan/ui/views/week_4/task1_view/w4task1_controller.dart';

// ignore: must_be_immutable
class CustomInfoTask extends StatelessWidget {
  final int index;
  final W4task1Controller controller;
  final ToDoModel taskToDo;

  const CustomInfoTask({
    super.key,
    required this.index,
    required this.controller,
    required this.taskToDo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 20.w,
          bottom: index + 1 == controller.showTasks.length ? 20.w : 0),
      width: 1.sw,
      height: 120.h,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: taskToDo.state == 'To Do'
                  ? Colors.blue.withOpacity(0.3)
                  : taskToDo.state == 'Processing'
                      ? AppColors.redColor.withOpacity(0.3)
                      : Colors.yellow.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
          border: Border(
              left: BorderSide(
                  width: 8.w,
                  color: taskToDo.state == 'To Do'
                      ? Colors.blue
                      : taskToDo.state == 'Processing'
                          ? AppColors.redColor
                          : Colors.yellow)),
          borderRadius: BorderRadius.circular(3.r)),
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 0.01.sw),
        child: Stack(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const CustomText(
                            heightText: 1,
                            textType: TextStyleType.body,
                            fontWeight: FontWeight.bold,
                            text: 'Task name: '),
                        SizedBox(
                          width: 250.w,
                          child: Tooltip(
                            message: taskToDo.title,
                            child: CustomText(
                                isTextAlign: TextAlign.left,
                                maxLines: 1,
                                heightText: 1,
                                textType: TextStyleType.body,
                                overflow: TextOverflow.ellipsis,
                                text: taskToDo.title!),
                          ),
                        ),
                      ],
                    ),
                    (15.h).ph,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                            heightText: 1,
                            fontWeight: FontWeight.bold,
                            textType: TextStyleType.body,
                            text: 'Description: '),
                        SizedBox(
                          width: 250.w,
                          child: Tooltip(
                            margin: EdgeInsets.symmetric(horizontal: 50.w),
                            message: taskToDo.description == ''
                                ? 'No data'
                                : taskToDo.description,
                            child: CustomText(
                              isTextAlign: TextAlign.left,
                              textType: TextStyleType.body,
                              overflow: TextOverflow.ellipsis,
                              text: taskToDo.description == ''
                                  ? 'No data'
                                  : taskToDo.description!,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    (15.h).ph,
                    Row(
                      children: [
                        const CustomText(
                            heightText: 1,
                            fontWeight: FontWeight.bold,
                            textType: TextStyleType.body,
                            text: 'Deadline: '),
                        SizedBox(
                          width: 230.w,
                          child: Tooltip(
                            message: taskToDo.deadLine == ''
                                ? 'Open time'
                                : taskToDo.deadLine,
                            child: CustomText(
                                heightText: 1,
                                isTextAlign: TextAlign.left,
                                textType: TextStyleType.body,
                                text: taskToDo.deadLine == ''
                                    ? 'Open time'
                                    : taskToDo.deadLine!),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                if (controller.indexTaskShowAction != index)
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        controller.showActionTask = true;
                        controller.indexTaskShowAction = index;
                        controller.update();
                      },
                      child: SizedBox(
                          height: 50.w,
                          width: 50.w,
                          child: Icon(
                            Icons.menu,
                            size: 30.w,
                            color: AppColors.mainColor,
                          )),
                    ),
                  ),
                Visibility(
                  visible: controller.showActionTask &&
                      controller.indexTaskShowAction == index,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 10.h,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Container(
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(color: AppColors.blackColor)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.selectDeadLine =
                                      taskToDo.deadLine!;
                                  controller.descriptionController.text =
                                      taskToDo.description!;
                                  controller.stateController = taskToDo.state!;
                                  controller.titleController.text =
                                      taskToDo.title!;
                                  showDialogActionTask(
                                      controller: controller,
                                      isAdd: false,
                                      id: taskToDo.id);
                                  controller.showActionTask = false;
                                  controller.indexTaskShowAction = -1;
                                  controller.update();
                                },
                                child: Container(
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.mainColor)),
                                    height: 30.h,
                                    child: Center(
                                        child: CustomText(
                                      text: 'Edit',
                                      fontSize: 15.sp,
                                      textType: TextStyleType.body,
                                      textColor: AppColors.whiteColor,
                                    ))),
                              ),
                              Divider(
                                color: AppColors.whiteColor,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.handleDeleteTask(id: taskToDo.id!);
                                  controller.showActionTask = false;
                                  controller.indexTaskShowAction = -1;
                                  controller.update();
                                },
                                child: Container(
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.mainColor)),
                                    height: 30.h,
                                    child: Center(
                                        child: CustomText(
                                            text: 'Delete',
                                            fontSize: 15.sp,
                                            textType: TextStyleType.body,
                                            textColor: AppColors.whiteColor))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
