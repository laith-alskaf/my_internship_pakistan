import 'package:get/get.dart';
import 'package:internship_pakistan/ui/views/tasks_view/tasks_view.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      Get.offAll(const TasksView());
    });
    super.onInit();
  }
}
