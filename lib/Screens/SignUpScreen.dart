import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_flutter/Network/rest_apis.dart';
import 'package:news_flutter/Screens/SignInScreen.dart';
import 'package:news_flutter/Utils/Colors.dart';
import 'package:news_flutter/Utils/Extensions.dart';
import 'package:news_flutter/Utils/Strings.dart';
import 'package:news_flutter/Utils/Widgets.dart';
import 'package:news_flutter/Utils/constant.dart';

class SignUpScreen extends StatefulWidget {
  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  bool isSelectedCheck;
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  var isLoading = false;
  var fNameCont = TextEditingController();
  var lNameCont = TextEditingController();
  var emailCont = TextEditingController();
  var usernameCont = TextEditingController();
  var passwordCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    isSelectedCheck = false;
    changeStatusColor(primaryColor);
  }

  signUpApi() async {
    hideKeyboard(context);
    var request = {
      'first_name': fNameCont.text,
      'last_name': lNameCont.text,
      'username': usernameCont.text,
      'email': emailCont.text,
      'password': passwordCont.text,
    };
    print(request);
    setState(() {
      isLoading = true;
    });
    createUser(request).then((res) {
      if (!mounted) return;
      toast('Register Successfully');
      setState(() {
        isLoading = false;
      });
      finish(context);
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      toast(error.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(primaryColor);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(primaryColor);
    return Stack(
      children: [
        Scaffold(
          backgroundColor: primaryColor,
          body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: white_color,
                  ),
                  onPressed: () {
                    finish(context);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.laptop_chromebook,
                      size: 30,
                      color: white_color,
                    ),
                    8.width,
                    App_Name.text(style: boldTextStyle(color: white_color, size: textSizeLarge))
                  ],
                ),
                16.height,
                Container(
                  decoration: boxDecoration(bgColor: white_color, radius: 10.0),
                  width: context.width(),
                  child: Column(
                    children: [
                      16.height,
                      Getting_Started.text(style: boldTextStyle(color: textColorPrimary, size: textSizeLargeMedium)),
                      8.height,
                      Create_an_Account_continue.text(style: secondaryTextStyle(color: textColorSecondary, size: textSizeMedium)),
                      16.height,
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            First_Name.text(style: secondaryTextStyle(color: textColorSecondary, size: textSizeSMedium)),
                            EditText(
                              iconName: Icons.supervised_user_circle,
                              isPassword: false,
                              mController: fNameCont,
                            ),
                            16.height,
                            Last_Name.text(style: secondaryTextStyle(color: textColorSecondary, size: textSizeSMedium)),
                            EditText(
                              iconName: Icons.supervised_user_circle,
                              isPassword: false,
                              mController: lNameCont,
                            ),
                            16.height,
                            UserName.text(style: secondaryTextStyle(color: textColorSecondary, size: textSizeSMedium)),
                            EditText(
                              iconName: Icons.supervised_user_circle,
                              isPassword: false,
                              mController: usernameCont,
                            ),
                            16.height,
                            Email_Address.text(style: secondaryTextStyle(color: textColorSecondary, size: textSizeSMedium)),
                            EditText(
                              iconName: Icons.email,
                              isPassword: false,
                              mController: emailCont,
                            ),
                            16.height,
                            Text(Password, style: secondaryTextStyle(color: textColorSecondary, size: textSizeSMedium)),
                            EditText(
                              iconName: Icons.lock_outline,
                              isPassword: true,
                              isSecure: true,
                              mController: passwordCont,
                            ),
                          ],
                        ).paddingAll(16.0),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                isSelectedCheck == false ? Icons.check_box_outline_blank : Icons.check_box,
                                size: 30,
                                color: isSelectedCheck == false ? textColorSecondary : primaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  isSelectedCheck = !isSelectedCheck;
                                });
                              }),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  TermCondition,
                                  style: primaryTextStyle(color: textColorSecondary, size: textSizeSMedium),
                                ),
                                4.height,
                                Text(
                                  Terms,
                                  style: primaryTextStyle(color: primaryColor, size: textSizeSMedium),
                                )
                              ],
                            ),
                          )
                        ],
                      ).paddingAll(8.0),
                      16.height,
                      NewsButton(
                          textContent: SignUp,
                          onPressed: () {
                            if (!accessAllowed) {
                              toast("Sorry");
                              return;
                            }
                            if (fNameCont.text.isEmpty)
                              toast(First_Name + Field_Required);
                            else if (lNameCont.text.isEmpty)
                              toast(Last_Name + Field_Required);
                            else if (emailCont.text.isEmpty)
                              toast(Email_Address + Field_Required);
                            else if (usernameCont.text.isEmpty)
                              toast(UserName + Field_Required);
                            else if (passwordCont.text.isEmpty)
                              toast(Password + Field_Required);
                            else {
                              isLoading = true;
                              signUpApi();
                            }
                          }).paddingOnly(left: 16.0, right: 16.0),
                      16.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Have_an_Account.text(),
                          Container(
                            margin: EdgeInsets.only(left: 4),
                            child: GestureDetector(
                                child: Text(SignIn, style: TextStyle(decoration: TextDecoration.underline, color: primaryColor, fontSize: textSizeMedium.toDouble())),
                                onTap: () {
                                  SignInScreen().launch(context);
                                }),
                          )
                        ],
                      ),
                      16.height,
                    ],
                  ),
                ).paddingAll(16.0),
              ],
            )),
          ),
        ),
        CircularProgressIndicator().center().visible(isLoading),
      ],
    );
  }
}
