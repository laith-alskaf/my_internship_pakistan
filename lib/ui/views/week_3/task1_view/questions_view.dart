import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/models/quiz_model.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_button.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_scaffold_task.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_show_snackbar.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';
import 'package:internship_pakistan/ui/shared/extension_sizebox.dart';
import 'package:internship_pakistan/ui/views/week_3/task1_view/result_view/result_view.dart';
import 'package:internship_pakistan/ui/views/week_3/task1_view/w3task1_controller.dart';
import 'package:internship_pakistan/ui/views/week_3/task1_view/w3task1_widget/custom_question_container.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView(
      {super.key,
      required this.questions,
      required this.titleQuiz,
      required this.controller});

  final List<QuestionsModel> questions;
  final String titleQuiz;
  final W3task1Controller controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<W3task1Controller>(builder: (c) {
      return PopScope(
        canPop: false,
        child: CustomScaffoldTask(
            onTap: () {
              if (controller.currentQuestion != 0) {
                controller.currentQuestion--;
              } else {
                Get.back();
                controller.resetQuiz();
              }
              controller.update();
            },
            titleAppbar: controller.quiz[controller.currentQuiz].title,
            title: '',
            children: [
              (20.h).ph,
              CustomText(
                text:
                    '${questions.length}/${(controller.currentQuestion).toInt()}',
                textType: TextStyleType.custom,
                textColor: AppColors.blackColor,
                fontSize: 25.sp,
              ),
              (10.h).ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: LinearProgressIndicator(
                    backgroundColor: AppColors.mainColor.withOpacity(0.5),
                    value: controller.spinnerValue,
                    color: AppColors.mainColor,
                    minHeight: 30.h,
                  ),
                ),
              ),
              (20.h).ph,
              CustomText(
                text: questions[controller.currentQuestion].question,
                textType: TextStyleType.subtitle,
                startPadding: 20.w,
                endPadding: 20.w,
                isTextAlign: TextAlign.center,
                topPadding: 20.h,
                textColor: AppColors.mainColor,
                fontWeight: FontWeight.bold,
              ),
              ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemExtent: 0.145.sh,
                  children: List.generate(
                      questions[controller.currentQuestion].answers.length,
                      (index) {
                    return CustomQuestionContainer(
                        answerText: questions[controller.currentQuestion]
                            .answers[index]
                            .answer,
                        value: questions[controller.currentQuestion]
                            .answers[index]
                            .id,
                        isCorrect: controller
                                .selectedAnswers[controller.currentQuestion] ==
                            questions[controller.currentQuestion].answerIdTrue,
                        isVisibleAnswerResult: false,
                        selected: controller
                            .selectedAnswers[controller.currentQuestion],
                        onTaped: (value) {
                          controller.selectAnswer(
                              questions[controller.currentQuestion]
                                  .answers[index]
                                  .id);
                          if (questions[controller.currentQuestion]
                                  .answerIdTrue ==
                              controller.selectedAnswers[
                                  controller.currentQuestion]) {
                            controller.isCorrect(true);
                          } else {
                            controller.isCorrect(false);
                          }
                        });
                  })),
              (20.h).ph,
              CustomButton(
                  onPressed: () {
                    if (controller
                            .selectedAnswers[controller.currentQuestion] !=
                        -1) {
                      if (questions.length > controller.currentQuestion + 1) {
                        controller.currentQuestion++;
                        controller.increaseSlider();
                        controller.update();
                      } else {
                        controller.handleFinishQuiz();
                        Get.off(() => ResultView(
                              controller: controller,
                            ));
                      }
                    } else {
                      showSnackBar(title: 'Please choose answer');
                    }
                  },
                  text: questions.length != controller.currentQuestion + 1
                      ? 'Next'
                      : 'Finish',
                  buttonTypeEnum: ButtonTypeEnum.normal)
            ]),
        onPopInvoked: (va) {
          if (controller.currentQuestion != 0) {
            controller.currentQuestion--;
          } else {
            controller.resetQuiz();

          }
          controller.update();

        },

      );
    });
  }
}
