import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/ui/models/info_model.dart';
import 'package:internship_pakistan/ui/views/week_1/task2_view/summary_view/summary_view.dart';

class Task2Controller extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey(debugLabel: 'InfoSubmit');
  bool loading = false;
  late InfoModel info;

  handleSubmitInfo() {
    info = InfoModel(name: name.text, email: email.text, message: message.text);
    loading = false;
    Get.to(() => SummaryView(info: info))!.then((s) {
      update();
    });
  }
}
