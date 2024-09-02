import 'package:get/get.dart';

class Task1Controller extends GetxController {
  int counter = 0;

  changeCounterValue({required bool increase}) {
    if (increase) {
      counter++;
    } else {
      if (counter != 0) {
        counter--;
      }
    }
    update();
  }
}
