import 'package:get/get.dart';
import 'package:internship_pakistan/models/to_do_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceRepositories {
  static SharedPreferences globalSharedPreferences = Get.find();



  //!----Keys----
  String PREF_TASK_LIST = 'task_list';

  void setTaskList(List<ToDoModel> list) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_TASK_LIST,
      value: ToDoModel.encode(list),
    );
  }

  List<ToDoModel> getTasksList() {
    if (globalSharedPreferences.containsKey(PREF_TASK_LIST)) {
      return ToDoModel.decode(getPreference(key: PREF_TASK_LIST));
    } else {
      return [];
    }
  }

  setPreference(
      {required DataType dataType,
      required String key,
      required dynamic value}) async {
    switch (dataType) {
      case DataType.INT:
        await globalSharedPreferences.setInt(key, value);
        break;
      case DataType.DOUBLE:
        await globalSharedPreferences.setDouble(key, value);
        break;
      case DataType.STRING:
        await globalSharedPreferences.setString(key, value);
        break;
      case DataType.BOOL:
        await globalSharedPreferences.setBool(key, value);
        break;

      case DataType.LISTSTRING:
        await globalSharedPreferences.setStringList(key, value);
        break;
    }
  }

  dynamic getPreference({required String key}) {
    return globalSharedPreferences.get(key);
  }

  clearPreference() {
    globalSharedPreferences.clear();
  }
}

enum DataType { INT, DOUBLE, STRING, BOOL, LISTSTRING }
