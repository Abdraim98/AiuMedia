import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_flutter/Screens/BottomNavigationScreen.dart';
import 'package:news_flutter/Utils/Colors.dart';
import 'package:news_flutter/Utils/Extensions.dart';
import 'package:news_flutter/Utils/Images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SharedPreferences pref;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(white_color);
  }

  init() async {
    await Future.delayed(Duration(seconds: 3));
    BottomNavigationScreen().launch(context, isNewTask: true);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(white_color);
    return Container(
      height: context.height(),
      width: context.width(),
      child: Image.asset(Splash_Img,height: context.height(),width: context.width(),fit: BoxFit.cover,),
    );
  }
}
