import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_button.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_show_snackbar.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text_field.dart';
import 'package:internship_pakistan/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/ui/views/week_2/task1_view/w2task1_controller.dart';

showDialogAddItem({required W2task1Controller controller}) {
  Get.dialog(Dialog(
    insetPadding: EdgeInsets.symmetric(horizontal: 0.1.sw),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(35.r))),
    child: IntrinsicHeight(
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
                  text: "Input information about item",
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
                hintText: 'Software department',
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
                text: "Body",
                textType: TextStyleType.body,
                textColor: AppColors.mainColor,
                fontWeight: FontWeight.normal,
              ),
              CustomTextFormField(
                hintText: 'Contain some languages like (java,python)',
                controller: controller.bodyController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please input your body';
                  }
                  return null;
                },
              ),
              (20.h).ph,
              GetBuilder<W2task1Controller>(builder: (c) {
                return controller.loading
                    ? SpinKitCircle(
                        color: AppColors.mainColor,
                        size: 50.w,
                      )
                    : Center(
                        child: CustomButton(
                          text: 'Add',
                          buttonTypeEnum: ButtonTypeEnum.normal,
                          width: 200.w,
                          onPressed: () {
                            // Get.closeAllSnackbars();
                            if (controller.formKey.currentState!.validate()) {
                              controller.loading = true;
                              controller.update();
                              Future.delayed(const Duration(seconds: 2))
                                  .then((value) {
                                Get.closeAllSnackbars();
                                controller.handleAddItem();
                                showSnackBar(title: 'Item added successfully');
                              });
                            }
                          },
                        ),
                      );
              }),
            ],
          ),
        ),
      ),
    ),
  ));
}
