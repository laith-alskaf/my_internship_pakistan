import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/models/quiz_model.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_button.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';
import 'package:internship_pakistan/ui/views/week_3/task1_view/w3task1_controller.dart';
import 'package:internship_pakistan/ui/views/week_3/task1_view/w3task1_view.dart';
import 'package:internship_pakistan/ui/views/week_3/task1_view/w3task1_widget/custom_question_container.dart';

class AnswersView extends StatelessWidget {
  const AnswersView(
      {super.key, required this.questions, required this.controller});

  final List<QuestionsModel> questions;
  final W3task1Controller controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<W3task1Controller>(builder: (c) {
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
                  text: 'Your Answers View',
                )),
            body: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.mainColor.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 3),
                        ),
                      ]),
                  padding: EdgeInsets.all(20.w),
                  height: 0.7.sh,
                  child: Scrollbar(
                    thickness: 2,
                    child: ListView(
                      children:
                          List.generate(questions.length, (indexQuestions) {
                        return Column(
                          children: [
                            CustomText(
                              text: questions[indexQuestions].question,
                              textType: TextStyleType.subtitle,
                              isTextAlign: TextAlign.center,
                              topPadding: 20.h,
                              textColor: AppColors.mainColor,
                              fontWeight: FontWeight.normal,
                            ),
                            Column(
                                children: List.generate(
                                    questions[indexQuestions].answers.length,
                                    (index) {
                              return CustomQuestionContainer(
                                  answerText: questions[indexQuestions]
                                      .answers[index]
                                      .answer,
                                  value: questions[indexQuestions]
                                      .answers[index]
                                      .id,
                                  isCorrect: controller
                                          .selectedAnswers[indexQuestions] ==
                                      questions[indexQuestions].answerIdTrue,
                                  isVisibleAnswerResult:
                                      controller.selectedAnswers[
                                                  indexQuestions] ==
                                              questions[indexQuestions]
                                                  .answers[index]
                                                  .id
                                          ? true
                                          : false,
                                  selected: controller
                                      .selectedAnswers[indexQuestions],
                                  onTaped: (value) {});
                            })),
                            if (indexQuestions + 1 != questions.length)
                              Divider(
                                color: AppColors.mainColor,
                                height: 2,
                                thickness: 3,
                              )
                          ],
                        );
                      }),
                    ),
                  ),
                ),
                CustomButton(
                  onPressed: () {
                    Get.off(() => const W3Task1View(title: 'Quiz App'));
                    controller.resetQuiz();
                  },
                  text: 'Go to Quizzes -->',
                  buttonTypeEnum: ButtonTypeEnum.normal,
                  width: 280.w,
                  height: 50.h,
                )
              ],
            ),
          ),
        ),
        onPopInvoked: (va) {
          Get.off(() => const W3Task1View(title: 'Quiz App'));
          controller.resetQuiz();
        },
      );
    });
  }
}
