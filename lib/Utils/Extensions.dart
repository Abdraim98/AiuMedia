import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

changeStatusColor(Color color) async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: color, statusBarBrightness: Brightness.dark,statusBarIconBrightness: Brightness.dark));
}
