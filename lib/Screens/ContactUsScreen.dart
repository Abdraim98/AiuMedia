import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_flutter/Utils/Colors.dart';
import 'package:news_flutter/Utils/Extensions.dart';
import 'package:news_flutter/Utils/Strings.dart';
import 'package:news_flutter/Utils/Widgets.dart';
import 'package:news_flutter/Utils/constant.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  ContactUsScreenState createState() => ContactUsScreenState();
}

class ContactUsScreenState extends State<ContactUsScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
    changeStatusColor(white_color);
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(white_color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: white_color,
        elevation: 5.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: blackColor,
            ),
            onPressed: () {
              finish(context);
            }),
        title: Text(
          Contact_Us,
          style: boldTextStyle(color: textColorPrimary, size: 18),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: <Widget>[
                16.height,
                editText1(UserName),
                24.height,
                editText1(Email),
                16.height,
                Container(
                  decoration: boxDecoration(bgColor: white_color, radius: 0.0, showShadow: true),
                  height: 100,
                  child: TextField(
                    scrollPadding: EdgeInsets.all(8.0),
                    style: TextStyle(color: textColorPrimary, fontSize: textSizeMedium.toDouble()),
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Brief Message',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(color: white_color, width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(color: white_color, width: 0.0),
                      ),
                    ),
                    maxLines: null,
                  ),
                ).paddingOnly(top: 16.0, bottom: 16.0),
                16.height,
                NewsButton(
                  textContent: Send,
                  height: 50,
                  onPressed: () {},
                )
              ],
            ).paddingAll(16.0),
          ),
        ),
      ),
    );
  }
}
