import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/ui/views/splash_screen_view/splash_screen_view.dart';
import 'package:internship_pakistan/ui/views/tasks_view/tasks_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(540, 960),
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: false,
      child: GetMaterialApp(
        defaultTransition: GetPlatform.isAndroid
            ? Transition.leftToRight
            : Transition.cupertino,
        transitionDuration: const Duration(microseconds: 300),
        debugShowCheckedModeBanner: false,
        title: 'Internship Pakstan',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:const  SplashScreenView(),
      ),
    );
  }
}
