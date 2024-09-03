import 'package:get/get.dart';
import 'package:internship_pakistan/ui/models/task_model.dart';
import 'package:internship_pakistan/ui/views/week_1/task1_view/task1_view.dart';
import 'package:internship_pakistan/ui/views/week_1/task2_view/task2_view.dart';

class TasksController extends GetxController {
  int currentWeek = -1;
  List<Week> weekTask = [
    Week(numberWeek: 1, tasks: [
      Task(
          id: 01,
          title: 'Build a Simple Counter App',
          done: true,
          goTo: () {
            Get.to(() => const Task1View(
                  title: 'Build a Simple Counter App',
                ));
          }),
      Task(
          id: 02,
          title: 'Create a Basic Contact Form',
          done: true,
          goTo: () {
            Get.to(() => const Task2View(
                  title: 'Create a Basic Contact Form',
                ));
          })
    ]),
  ];

  handleClickWeek({required int index}) {
    currentWeek = index;
    update();
  }
}
