import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/views/week_4/task1_view/w4task1_controller.dart';

class StaticCustomDrop extends StatelessWidget {
  final RxList<String> itemList;
  final double? width;
  final double? textSize;
  final double? height;
  final W4task1Controller controller;

  const StaticCustomDrop(
      {super.key,
      required this.itemList,
      this.width,
      this.height,
      this.textSize,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
        onMenuStateChange: (_) {},
        buttonStyleData: ButtonStyleData(
          height: height ?? 0.07.sh,
          width: width ?? 0.25.sw,
          padding: const EdgeInsetsDirectional.only(start: 14, end: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: AppColors.grayColor,
            ),
            color: AppColors.grayColor,
          ),
          elevation: 2,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        hint: Text(
          controller.stateController == ''
              ? 'To Do , Processing , Finished'
              : controller.stateController,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: textSize ?? 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        items: itemList.map<DropdownMenuItem<String>>((element) {
          return DropdownMenuItem<String>(
            value: element,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  element.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: 1.sw,
                  height: 3.h,
                  color: AppColors.blackColor,
                )
              ],
            ),
          );
        }).toList(),
        iconStyleData: IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down_rounded,
            color: AppColors.whiteColor,
            size: 30,
          ),
          iconSize: 50.r,
        ),
        isExpanded: true,
        onChanged: (String? y) {
          controller.stateController = y!;
          controller.update();
        },
      ));
    });
  }
}
