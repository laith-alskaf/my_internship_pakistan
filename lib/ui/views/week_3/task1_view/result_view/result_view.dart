import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/models/quiz_model.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_button.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';
import 'package:internship_pakistan/ui/shared/extension_sizebox.dart';
import 'package:internship_pakistan/ui/views/week_3/task1_view/result_view/answers_view.dart';
import 'package:internship_pakistan/ui/views/week_3/task1_view/w3task1_controller.dart';
import 'package:internship_pakistan/ui/views/week_3/task1_view/w3task1_view.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key, required this.controller});

  final W3task1Controller controller;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
          child: Scaffold(
              backgroundColor: AppColors.whiteColor,
              appBar: AppBar(
                  backgroundColor: AppColors.mainColor,
                  centerTitle: true,
                  leading: const SizedBox(),
                  title: CustomText(
                    textColor: AppColors.whiteColor,
                    textType: TextStyleType.title,
                    fontWeight: FontWeight.bold,
                    text: 'Result',
                  )),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (0.25.sh).ph,
                  Container(
                    width: 250.w,
                    height: 70.h,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(30.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.r),
                            topRight: Radius.circular(15.r)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: QuizStatus.Bad ==
                                    controller.quiz[controller.currentQuiz]
                                        .quizStatus!
                                ? AppColors.redColor
                                : (QuizStatus.Good ==
                                        controller.quiz[controller.currentQuiz]
                                            .quizStatus!
                                    ? Colors.yellow
                                    : (QuizStatus.VeryGood ==
                                            controller
                                                .quiz[controller.currentQuiz]
                                                .quizStatus!
                                        ? Colors.orange
                                        : AppColors.greenColor)),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, -2),
                          ),
                        ]),
                    child: CustomText(
                      text: controller
                          .quiz[controller.currentQuiz].quizStatus!.name,
                      textType: TextStyleType.custom,
                      fontSize: 35.sp,
                      fontWeight: FontWeight.bold,
                      textColor: QuizStatus.Bad ==
                              controller
                                  .quiz[controller.currentQuiz].quizStatus!
                          ? AppColors.redColor
                          : (QuizStatus.Good ==
                                  controller
                                      .quiz[controller.currentQuiz].quizStatus!
                              ? Colors.yellow
                              : (QuizStatus.VeryGood ==
                                      controller.quiz[controller.currentQuiz]
                                          .quizStatus!
                                  ? Colors.orange
                                  : AppColors.greenColor)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(30.w),
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: QuizStatus.Bad ==
                                    controller.quiz[controller.currentQuiz]
                                        .quizStatus!
                                ? AppColors.redColor
                                : (QuizStatus.Good ==
                                        controller.quiz[controller.currentQuiz]
                                            .quizStatus!
                                    ? Colors.yellow
                                    : (QuizStatus.VeryGood ==
                                            controller
                                                .quiz[controller.currentQuiz]
                                                .quizStatus!
                                        ? Colors.orange
                                        : AppColors.greenColor)),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(1, 1),
                          ),
                        ]),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 240.w,
                              child: CustomText(
                                text: 'Count Correct Answer:',
                                textType: TextStyleType.body,
                                textColor: AppColors.grayColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            CustomText(
                              text: controller.countCorrectAnswer.toString(),
                              textType: TextStyleType.custom,
                              textColor: AppColors.blackColor,
                              fontSize: 40.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                        Divider(
                          indent: 230.w,
                          endIndent: 165.w,
                          color: AppColors.blackColor,
                          height: 2,
                          thickness: 2,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 240.w,
                              child: CustomText(
                                text: 'Count Questions:',
                                textType: TextStyleType.body,
                                textColor: AppColors.grayColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            CustomText(
                              text: controller
                                  .quiz[controller.currentQuiz].questions.length
                                  .toString(),
                              textType: TextStyleType.custom,
                              textColor: AppColors.blackColor,
                              fontSize: 40.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (controller.countCorrectAnswer !=
                          controller
                              .quiz[controller.currentQuiz].questions.length)
                        CustomButton(
                            text: 'Show Answers',
                            buttonTypeEnum: ButtonTypeEnum.medium,
                            width: 260.w,
                            height: 55.h,
                            onPressed: () {
                              Get.off(() => AnswersView(
                                    controller: controller,
                                    questions: controller
                                        .quiz[controller.currentQuiz].questions,
                                  ));
                            }),
                      GestureDetector(
                        onTap: () {
                          Get.off(() => const W3Task1View(title: 'Quiz App'));
                          controller.resetQuiz();
                        },
                        child: const CustomText(
                            text: 'Go to Quizzes -->',
                            textType: TextStyleType.bodyBig),
                      )
                    ],
                  ),
                  (90.h).ph
                ],
              ))),
      onPopInvoked: (va) {
        Get.off(() => const W3Task1View(title: 'Quiz App'));
        controller.resetQuiz();
        },
    );
  }
}
