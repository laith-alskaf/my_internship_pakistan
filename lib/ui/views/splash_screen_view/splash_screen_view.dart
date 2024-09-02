import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';
import 'package:internship_pakistan/ui/shared/extension_sizebox.dart';
import 'package:internship_pakistan/ui/views/splash_screen_view/splash_screen_controller.dart';

// ignore: must_be_immutable
class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Column(
          children: [
            (200.h).ph,
            FadeInDown(
              duration: const Duration(milliseconds: 1000),
              delay: const Duration(milliseconds: 300),
              child: Image.asset(
                'assets/images/splash.png',
                scale: 1.8,
              ),
            ),
            const Spacer(),
            // (30.h).ph,
            ZoomIn(
              duration: const Duration(milliseconds: 600),
              delay: const Duration(milliseconds: 1300),
              child: CustomText(
                startPadding: 20.w,
                endPadding: 20.w,
                text:
                    'Welcome, this application contains the tests completed by the trainee Laith Al-Skaf',
                textType: TextStyleType.title,
                isTextAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
                textColor: AppColors.mainColor,
              ),
            ),
            (200.h).ph,
          ],
        ));
  }
}
