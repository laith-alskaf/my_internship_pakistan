import 'dart:convert';

class ToDoModel {
  int? id;
  String? title;
  String? description;
  String? deadLine;
  String? state;

  ToDoModel({
    required this.id,
    required this.title,
    required this.deadLine,
    required this.description,
    required this.state,
  });

  ToDoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    deadLine = json['deadLine'];
    description = json['description'];
    state = json['state'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['deadLine'] = this.deadLine;
  //   data['description'] = this.description;
  //   data['state'] = this.state;
  //   return data;
  // }

  static String encode(List<ToDoModel> list) => json.encode(
        list
            .map<Map<String, dynamic>>((element) => ToDoModel.toMap(element))
            .toList(),
      );

  static Map<String, dynamic> toMap(ToDoModel model) {
    return {
      'id': model.id,
      'title': model.title,
      'deadLine': model.deadLine,
      'state': model.state,
      'description': model.description,
    };
  }

  static List<ToDoModel> decode(String strList) =>
      (json.decode(strList) as List<dynamic>)
          .map<ToDoModel>((item) => ToDoModel.fromJson(item))
          .toList();
}
