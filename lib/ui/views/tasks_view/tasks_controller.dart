import 'package:get/get.dart';
import 'package:internship_pakistan/models/task_model.dart';
import 'package:internship_pakistan/ui/views/week_1/task1_view/w1task1_view.dart';
import 'package:internship_pakistan/ui/views/week_1/task2_view/w1task2_view.dart';
import 'package:internship_pakistan/ui/views/week_2/task1_view/w2task1_view.dart';
import 'package:internship_pakistan/ui/views/week_3/task1_view/w3task1_view.dart';
import 'package:internship_pakistan/ui/views/week_4/task1_view/w4task1_view.dart';

class TasksController extends GetxController {
  int currentWeek = -1;
  List<Week> weekTask = [
    Week(numberWeek: 1, tasks: [
      Task(
          id: 01,
          title: 'Simple Counter App',
          done: true,
          goTo: () {
            Get.to(() => const W1Task1View(
                  title: 'Simple Counter App',
                ));
          }),
      Task(
          id: 02,
          title: 'Basic Contact Form',
          done: true,
          goTo: () {
            Get.to(() => const W1Task2View(
                  title: 'Basic Contact Form',
                ));
          })
    ]),
    Week(numberWeek: 2, tasks: [
      Task(
          id: 01,
          title: 'Simple Shopping List App',
          done: true,
          goTo: () {
            Get.to(() => const W2Task1View(
                  title: 'Simple Shopping List App',
                ));
          }),
    ]),
    Week(numberWeek: 3, tasks: [
      Task(
          id: 01,
          title: 'Quiz App',
          done: true,
          goTo: () {
            Get.to(() => const W3Task1View(
                  title: 'Quiz App',
                ));
          }),
    ]),
    Week(numberWeek: 4, tasks: [
      Task(
          id: 01,
          title: 'To Do App',
          done: true,
          goTo: () {
            Get.to(() => const W4task1View(
                  title: 'To Do App',
                ));
          }),
    ]),
  ];

  handleClickWeek({required int index}) {
    currentWeek = index;
    update();
  }
}
