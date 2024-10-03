import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internship_pakistan/local_storage/shared_preference_repositories.dart';

double get sizeTextTitle => 30.sp; //30

double get sizeTextSupHeader => 27.sp; //25

double get sizeTextBodyBig => 22.sp; //20

double get sizeTextBody => 20.sp; //18

double get defaultSizeSmall => 18.sp; //16

bool isEmail(String value) {
  RegExp regExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
  return regExp.hasMatch(value);
}

SharedPreferenceRepositories get storage =>
    Get.find<SharedPreferenceRepositories>();
