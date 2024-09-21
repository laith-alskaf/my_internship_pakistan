import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_scaffold_task.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_text.dart';
import 'package:internship_pakistan/ui/shared/extension_sizebox.dart';
import 'package:internship_pakistan/ui/views/week_3/task1_view/questions_view.dart';
import 'package:internship_pakistan/ui/views/week_3/task1_view/w3task1_controller.dart';
import 'package:internship_pakistan/ui/views/week_3/task1_view/w3task1_widget/container_quiz.dart';

class W3Task1View extends StatelessWidget {
  const W3Task1View({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldTask(taskNumber: '1', title: title, children: [
      (20.h).ph,
      GetBuilder<W3task1Controller>(
          init: W3task1Controller(),
          builder: (controller) {
            return controller.quiz.isEmpty
                ? Center(
                    child: CustomText(
                        topPadding: 0.34.sh,
                        text: 'Not Exist Quiz',
                        textType: TextStyleType.subtitle),
                  )
                : Scrollbar(
                    thickness: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 30.h, horizontal: 20.w),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Wrap(
                            spacing: 30.w,
                            runSpacing: 30.w,
                            children:
                                List.generate(controller.quiz.length, (index) {
                              return GestureDetector(
                                  onTap: () {
                                    controller.currentQuiz = index;
                                    controller.initLists();
                                    Get.to(() => QuestionsView(
                                          controller: controller,
                                          questions:
                                              controller.quiz[index].questions,
                                          titleQuiz:
                                              controller.quiz[index].title,
                                        ));
                                  },
                                  child: ContainerQuiz(
                                      quiz: controller.quiz[index]));
                            })),
                      ),
                    ),
                  );
          }),
      (20.h).ph,
    ]);
  }
}
