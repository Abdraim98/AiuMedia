import 'package:flutter/material.dart';


const primaryColor = Color(0xFFffb4b8);
const textColorPrimary = Color(0xFF212121);
const textColorSecondary = Color(0xFF757575);
const white_color = Color(0xFFFFFFFF);
const shadow_color = Color(0xFFECECEC);
const app_Background = Color(0xFFf3f5f9);
const view_color = Color(0XFFDADADA);
const light_grayColor = Color(0xFFF5F6F7);
const Darker_GrayColor = Color(0xFF757575);
const lite_grayColor = Color(0xFFF2F5F8);
const light_blueColor = Color(0xFFE2E6EC);
const blueColor = Color(0xFF323642);
const DarkBlueColor = Color(0xFF323642);
const lightGrey = Color(0xFFc9c9c9);
var darkBgColor = Colors.grey[850];
var lightBgColor = Colors.grey[300];
const kGrey400 = Color(0xFF90a4ae);

var catColor1 = Color(0xFF4481c5);
var catColor2 = Color(0xFFe36057);
var catColor3 = Color(0xFFeac065);
var catColor4 = Color(0xFF4fb6b0);
var catColor5 = Color(0xFF8286e5);

final List<String> categoryColors = [
  '#4481c5',
  '#e36057',
  '#eac065',
  '#4fb6b0',
  '#8286e5',
];

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor materialColor(colorHax) {
  return MaterialColor(colorHax, color);
}

MaterialColor colorCustom = MaterialColor(0xFF5959fc, color);
