import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/models/to_do_model.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/alert_dialog_delete.dart';
import 'package:internship_pakistan/ui/shared/custom_widget/custom_show_snackbar.dart';
import 'package:internship_pakistan/ui/shared/utils.dart';

class W4task1Controller extends GetxController {
  String filterTask = 'All';
  String selectDeadLine = '';
  bool expandContainer = false;
  List<String> taskState = ['To Do', 'Processing', 'Finished'];
  final GlobalKey<FormState> formKey = GlobalKey(debugLabel: 'AddTask');
  int id = 0;
  TextEditingController titleController = TextEditingController();
  String stateController = '';
  TextEditingController descriptionController = TextEditingController();
  RxList<ToDoModel> showTasks = <ToDoModel>[].obs;
  bool showActionTask = false;
  int indexTaskShowAction = -1;
  List<ToDoModel> allTask = <ToDoModel>[];

  handleAddTask() {
    id++;
    allTask.insert(
        0,
        ToDoModel(
            title: titleController.text,
            state: stateController,
            id: id,
            description: descriptionController.text,
            deadLine: selectDeadLine));
    initListFilterTask();
    storage.setTaskList(allTask);
    update();
  }

  handleEditTask({required int id}) {
    int index = allTask.indexWhere((task) {
      return task.id == id;
    });
    allTask[index] = ToDoModel(
        id: id,
        title: titleController.text,
        deadLine: selectDeadLine,
        description: descriptionController.text,
        state: stateController);
    initListFilterTask();

    update();
    storage.setTaskList(allTask);
  }

  handleDeleteTask({required int id}) {
    showAlertDelete(
        text: 'Are you sure delete this task',
        onTap: () {
          Get.closeAllSnackbars();
          allTask.removeWhere((task) => task.id == id);
          initListFilterTask();
          storage.setTaskList(allTask);
          showActionTask = false;
          indexTaskShowAction = -1;
          Get.back();
          showSnackBar(title: 'Task has been successfully deleted');
          update();
          if (Get.isDialogOpen == true) {
            Get.back();
          }
        });
  }

  initListFilterTask() {
    showTasks.clear();
    if (filterTask == 'All') {
      showTasks.value = allTask.obs;
    } else if (filterTask == 'Finished') {
      showTasks.value = allTask.where((task) {
        return task.state == 'Finished';
      }).toList();
    } else if (filterTask == 'Processing') {
      showTasks.value = allTask.where((task) {
        return task.state == 'Processing';
      }).toList();
    } else {
      showTasks.value = allTask.where((task) {
        return task.state == 'To Do';
      }).toList();
    }
  }

  handleChangeFilterTask({required String filter}) {
    if (filter != filterTask) {
      filterTask = filter;
      initListFilterTask();
      update();
    }
  }

  @override
  void onInit() {
    allTask = storage.getTasksList();
    if (allTask.isEmpty) {
      id = 1;
    } else {
      id = allTask.last.id! + 1;
    }
    showTasks.value = allTask.obs;
    update();
    Future.delayed(const Duration(milliseconds: 800), () {
      expandContainer = true;
      update();
    });
    super.onInit();
  }
}
