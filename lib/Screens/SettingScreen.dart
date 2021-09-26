import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_flutter/Model/LanguageModel.dart';
import 'package:news_flutter/Screens/ChangePasswordScreen.dart';
import 'package:news_flutter/Utils/Colors.dart';
import 'package:news_flutter/Utils/Extensions.dart';
import 'package:news_flutter/Utils/Strings.dart';
import 'package:news_flutter/Utils/constant.dart';

class SettingScreen extends StatefulWidget {
  @override
  SettingScreenState createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  String selectedValue = 'English';

  int selectedLanguage = 0;

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
    setState(() {
      Language.getLanguages()[selectedLanguage].name;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(white_color);
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
          Settings,
          style: boldTextStyle(color: textColorPrimary, size: 18),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.all(8),
                        child: 'Language'.text(style: boldTextStyle(color: textColorPrimary, size: textSizeMedium))),
                  ),
//                  DropdownButton<String>(
//                    items: <String>['English','Hindi','Spanish','Afrikaans','German','Indonesian','Portuguese','Turkish'].map((String value) {
//                      return DropdownMenuItem<String>(
//                        value: value,
//                        child: Text(value,style: primaryTextStyle(color: textColorPrimary,size: textSizeMedium),),
//                      );
//                    }).toList(),
//                    value: selectedValue,
//                    onChanged: (newVal) {
//                      setState(() {
//                        selectedValue = newVal;
//                      });
//                    },
//                  ).paddingOnly(right: 8.0),
                  DropdownButton(
                    value: Language.getLanguages()[selectedLanguage].name,
                    onChanged: (newValue) {
                      setState(() {
                        for (var i = 0; i < Language.getLanguages().length; i++) {
                          if (newValue == Language.getLanguages()[i].name) {
                            selectedLanguage = i;
                          }
                        }
//                        pref.setString(SELECTED_LANGUAGE_CODE, Language.getLanguages()[selectedLanguage].languageCode);
//                        pref.setInt(SELECTED_LANGUAGE_INDEX, selectedLanguage);
//                        Provider.of<AppState>(context, listen: false).changeLocale(Locale(Language.getLanguages()[selectedLanguage].languageCode, ''));
//                        Provider.of<AppState>(context, listen: false).changeLanguageCode(Language.getLanguages()[selectedLanguage].languageCode);
                      });
                    },
                    items: Language.getLanguages().map((language) {
                      return DropdownMenuItem(
                        child: Row(
                          children: <Widget>[
                            Image.asset(language.flag, width: 24, height: 24),
                            SizedBox(width: 10),
                            Text(language.name),
                          ],
                        ),
                        value: language.name,
                      );
                    }).toList(),
                  ),
                ],
              ).paddingOnly(right: 8.0),
              SizedBox(height: 16),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Change_Password.text(style: boldTextStyle(color: textColorPrimary, size: textSizeMedium)),
                      Icon(Icons.keyboard_arrow_right,size: 30,color: textColorSecondary,).paddingRight(4.0)
                    ],
                  ).paddingOnly(left: 12.0,right: 4.0),
                  Divider()
                ],
              ).onTap(() {
                ChangePasswordScreen().launch(context);
              })
            ],
          ),
        ),
      ),
    );
  }
}
