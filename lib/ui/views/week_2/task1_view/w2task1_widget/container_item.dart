import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';
import 'package:internship_pakistan/ui/shared/extension_sizebox.dart';

class ContainerItem extends StatelessWidget {
  const ContainerItem({super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 100.h,
      width: 1.sw,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.mainColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ]),
      child: Row(
        children: [
          Image.asset('assets/images/training.jpg',width: 120.w,),
          (20.w).pw,
          SizedBox(
            width: 340.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: title,
                  textType: TextStyleType.bodyBig,
                  textColor: AppColors.mainColor,
                  heightText: 1.1,
                ),
                (10.h).ph,
                CustomText(
                  text: body,
                  textType: TextStyleType.body,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.normal,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
