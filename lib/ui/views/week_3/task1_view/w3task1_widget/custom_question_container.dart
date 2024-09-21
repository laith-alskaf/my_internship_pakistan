import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_pakistan/ui/shared/colors.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';
import 'package:internship_pakistan/ui/views/week_3/task1_view/w3task1_widget/custom_radio.dart';

class CustomQuestionContainer extends StatelessWidget {
  final Color? borderColor;
  final String? answerText;
  final bool isCorrect;
  final bool isVisibleAnswerResult;
  final int value;
  final Color? fillColor;
  final Function(int?)? onTaped;
  final int selected;

  const CustomQuestionContainer({
    super.key,
    this.borderColor,
    this.answerText,
    required this.isCorrect,
    required this.isVisibleAnswerResult,
    required this.value,
    this.fillColor,
    required this.onTaped,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
      child: GestureDetector(
        onTap: () {
          onTaped!(value);
        },
        child: Container(
          constraints: BoxConstraints(
              minHeight: 20.h,
              minWidth: 20.h,
              maxWidth: double.infinity,
              maxHeight: double.infinity),
          decoration: BoxDecoration(
            border: Border.all(
                color: isVisibleAnswerResult
                    ? (isCorrect ? AppColors.greenColor : AppColors.redColor)
                    : AppColors.mainColor),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomRadio(
                value: value,
                onTaped: onTaped,
                selected: selected,
                fillColor: isVisibleAnswerResult
                    ? (isCorrect ? AppColors.greenColor : AppColors.redColor)
                    : AppColors.mainColor,
                scaleX: 1.3,
                scaleY: 1.3,
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: CustomText(
                  text: answerText!,
                  textColor: isVisibleAnswerResult
                      ? (isCorrect ? AppColors.greenColor : AppColors.redColor)
                      : AppColors.mainColor,
                  textType: TextStyleType.body,
                  heightText: 1.5,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
