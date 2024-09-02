import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internship_pakistan/app/my_app.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}
