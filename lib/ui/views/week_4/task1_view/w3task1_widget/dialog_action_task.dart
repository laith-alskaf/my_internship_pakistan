import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_button.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_date_picker.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_show_snackbar.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text_field.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/static_custom_drop.dart';
import 'package:internship_pakistan/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/ui/views/week_4/task1_view/w4task1_controller.dart';

showDialogActionTask(
    {required W4task1Controller controller, required bool isAdd, int? id}) {
  Get.dialog(Dialog(
    insetPadding: EdgeInsets.symmetric(horizontal: 0.1.sw),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(35.r))),
    child: IntrinsicHeight(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.w),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          // width: 400.w,
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomText(
                    text: "Input information about Task",
                    textType: TextStyleType.subtitle,
                    textColor: AppColors.mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                  ),
                ),
                (20.h).ph,
                CustomText(
                  bottomPadding: 10.h,
                  text: "Title",
                  textType: TextStyleType.body,
                  textColor: AppColors.mainColor,
                  fontWeight: FontWeight.normal,
                ),
                CustomTextFormField(
                  hintText: 'Init project flutter',
                  controller: controller.titleController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please input your title';
                    }
                    return null;
                  },
                ),
                (20.h).ph,
                CustomText(
                  bottomPadding: 10.h,
                  text: "Description",
                  textType: TextStyleType.body,
                  textColor: AppColors.mainColor,
                  fontWeight: FontWeight.normal,
                ),
                CustomTextFormField(
                  hintText: 'Don\'t miss this task',
                  controller: controller.descriptionController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please input your Description';
                    }
                    return null;
                  },
                ),
                (20.h).ph,
                CustomText(
                  bottomPadding: 10.h,
                  text: "Deadline",
                  textType: TextStyleType.body,
                  textColor: AppColors.mainColor,
                  fontWeight: FontWeight.normal,
                ),
                GetBuilder<W4task1Controller>(builder: (c) {
                  return CustomDatePicker(
                    controller: controller,
                    pickFirst: true,
                    width: 1.sw,
                    firstDate: DateTime(
                        2024, DateTime.now().month, DateTime.now().day + 1),
                    hintText: '',
                    lastDate: DateTime(DateTime.now().year + 18),
                    initialDate: DateTime(
                        2024, DateTime.now().month, DateTime.now().day + 1),
                  );
                }),
                (20.h).ph,
                CustomText(
                  bottomPadding: 10.h,
                  text: "State",
                  textType: TextStyleType.body,
                  textColor: AppColors.mainColor,
                  fontWeight: FontWeight.normal,
                ),
                GetBuilder<W4task1Controller>(builder: (contr) {
                  return StaticCustomDrop(
                    itemList: controller.taskState.obs,
                    height: 50.h,
                    width: 0.8.sw,
                    controller: controller,
                  );
                }),
                (20.h).ph,
                Center(
                  child: CustomButton(
                    text: isAdd ? 'Add' : 'Edit',
                    buttonTypeEnum: ButtonTypeEnum.normal,
                    width: 200.w,
                    onPressed: () {
                      if (isAdd) {
                        if (controller.formKey.currentState!.validate()) {
                          if (controller.selectDeadLine != '' &&
                              controller.stateController != '') {
                            controller.update();
                            Get.back();
                            Future.delayed(const Duration(seconds: 1))
                                .then((value) {
                              Get.closeAllSnackbars();
                              controller.handleAddTask();
                              showSnackBar(title: 'Task Added Successfully');
                            });
                          } else {
                            showSnackBar(
                                title: 'Please fill in the blank fields');
                          }
                        }
                      } else {
                        Get.back();
                        Get.closeAllSnackbars();
                        controller.handleEditTask(id: id!);
                        showSnackBar(title: 'Update Task Successfully');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ));
}
