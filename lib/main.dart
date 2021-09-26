import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/Screens/SplashScreen.dart';
import 'package:news_flutter/Utils/Colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    if(Platform.isIOS) {
//      return CupertinoApp(
//          color: Colors.white,
//          theme: CupertinoThemeData(
//            barBackgroundColor: white_color,
//            primaryColor: white_color,
//            scaffoldBackgroundColor: app_Background,
//          ),
//          home: SplashScreen(),
//          debugShowCheckedModeBanner: false);
//    }else {
//      return MaterialApp(
//          theme: ThemeData(
//            primaryColor: Colors.white,
//            backgroundColor: white_color,
//            scaffoldBackgroundColor: app_Background,
//            fontFamily: 'SFUIText',
//          ),
//          home: SplashScreen(),
//          debugShowCheckedModeBanner: false);
//    }
    return MaterialApp(
        theme: ThemeData(
          primaryColor: white_color,
          backgroundColor: white_color,
          scaffoldBackgroundColor: app_Background,
          fontFamily: 'SFUIText',
        ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false);
  }
}
