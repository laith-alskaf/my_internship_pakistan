import 'package:flutter/cupertino.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/models/item_model.dart';

class W2task1Controller extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey(debugLabel: 'AddItem');
  bool loading = false;
  SwipeActionController swipeActionController = SwipeActionController();
  List<Item> items = [
    Item(
        title: 'Software department',
        body: 'Flutter Custom Animation - Grocery App - Speed Code',
        id: 1),
    Item(
        title: 'Designs and graphics',
        body: 'Flutter Custom Animation - Grocery App - Speed Code',
        id: 2),
    Item(
        title: 'Video montage and editing',
        body: 'Flutter Custom Animation - Grocery App - Speed Code',
        id: 3),
    Item(
        title: 'Practical and vocational training',
        body: 'Flutter Custom Animation - Grocery App - Speed Code',
        id: 4),
    Item(
        title: 'Technical and software support',
        body: 'Flutter Custom Animation - Grocery App - Speed Code',
        id: 5),
    Item(
        title: 'Digital marketing and social media management',
        body: 'Flutter Custom Animation - Grocery App - Speed Code',
        id: 6),
    Item(
        title: 'Digital marketing and social media management',
        body: 'Flutter Custom Animation - Grocery App - Speed Code',
        id: 7),
    Item(
        title: 'Digital marketing and social media management',
        body: 'Flutter Custom Animation - Grocery App - Speed Code',
        id: 8),
  ];
  int id=8;
  handleAddItem() {
    id++;
    items.insert(
        0, Item(title: titleController.text, body: bodyController.text, id: id));
    loading = false;
    update();
    Get.back();
    titleController.clear();
    bodyController.clear();
  }
}
