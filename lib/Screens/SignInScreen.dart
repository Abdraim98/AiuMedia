import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_flutter/Network/rest_apis.dart';
import 'package:news_flutter/Screens/BottomNavigationScreen.dart';
import 'package:news_flutter/Screens/SignUpScreen.dart';
import 'package:news_flutter/Utils/Colors.dart';
import 'package:news_flutter/Utils/Extensions.dart';
import 'package:news_flutter/Utils/Images.dart';
import 'package:news_flutter/Utils/Strings.dart';
import 'package:news_flutter/Utils/Widgets.dart';
import 'package:news_flutter/Utils/constant.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isSelectedCheck;
  var isLoading = false;

  var emailCont = TextEditingController();
  var passwordCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    isSelectedCheck = false;
    changeStatusColor(primaryColor);
  }

  void signInApi(req) async {
    setState(() {
      isLoading = true;
    });
    await login(req).then((res) async {
      if (!mounted) return;
      print(res);
      setInt(USER_ID, res['user_id']);
      setString(FIRST_NAME, res['first_name']);
      setString(LAST_NAME, res['last_name']);
      setString(USER_EMAIL, res['user_email']);
      setString(USERNAME, res['user_nicename']);
      setString(TOKEN, res['token']);
      setString(AVATAR, res['avatar']);
      if (res['profile_image'] != null) {
        setString(PROFILE_IMAGE, res['profile_image']);
      }
      setString(USER_DISPLAY_NAME, res['user_display_name']);
      setBool(IS_LOGGED_IN, true);
      setState(() {
        isLoading = false;
      });

      toast(SuccessFully_logging);

      BottomNavigationScreen().launch(context);
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
          backgroundColor: white_color,
          body: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Stack(
                children: [
                  ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Container(
                        height: context.height() * 0.28,
                        color: primaryColor,
                      )),
                  Image.asset(SignInLogo,height: context.height() * 0.3,width: context.width(),)
                ],
              ),
              16.height,
              Text(Title_For_Sign_In, style: boldTextStyle(color: textColorPrimary, size: textSizeLarge)),
              8.height,
              Text(Welcome_Msg_for_SignIn, style: secondaryTextStyle(color: textColorSecondary, size: textSizeSMedium)),
              16.height,
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(Username_or_Email, style: secondaryTextStyle(color: textColorSecondary, size: textSizeSMedium)),
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
                ).paddingAll(20.0),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Forgot.text(style: primaryTextStyle(color: textColorSecondary, size: textSizeMedium)),
              ).paddingRight(16.0).onTap(() {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => CustomDialog(),
                );
              }),
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
                textContent: SignIn,
                onPressed: () {
                  hideKeyboard(context);
                  var request = {"username": "${emailCont.text}", "password": "${passwordCont.text}"};
                  if (!mounted) return;
                  setState(() {
                    if (emailCont.text.isEmpty)
                      toast(Email_Address + Field_Required);
                    else if (passwordCont.text.isEmpty)
                      toast(Password + Field_Required);
                    else {
                      isLoading = true;
                      print(request);
                      signInApi(request);
                    }
                  });
                  if (!accessAllowed) {
                    toast("Sorry");
                    return;
                  }
                },
              ).paddingOnly(left: 16.0, right: 16.0),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    don_t_have_account,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    child: GestureDetector(
                        child: Text(SignUp, style: TextStyle(decoration: TextDecoration.underline, color: primaryColor, fontSize: textSizeMedium.toDouble())),
                        onTap: () {
                          SignUpScreen().launch(context);
                        }),
                  )
                ],
              ),
            ],
          )),
        ),
        CircularProgressIndicator().center().visible(isLoading),
      ],
    );
  }
}

class CustomDialog extends StatelessWidget {
  var email = TextEditingController();
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    forgotPwdApi() async {
      hideKeyboard(context);

      var request = {
        'email': email.text,
      };

      forgotPassword(request).then((res) {
        isLoading = false;
        toast('Successfully Send Email');
        finish(context);
      }).catchError((error) {
        toast(error.toString());
      });
    }

    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: boxDecoration(color: white_color, radius: 10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      16.height,
                      Forgot_Password.text(style: boldTextStyle(color: textColorPrimary, size: textSizeLargeMedium)),
                      16.height,
                      Text(Username_or_Email, style: secondaryTextStyle(color: textColorSecondary, size: textSizeSMedium)),
                      EditText(
                        iconName: Icons.email,
                        isPassword: false,
                        mController: email,
                      ),
                    ],
                  ).paddingOnly(left: 16.0, right: 16.0, bottom: 16.0),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: NewsButton(
                        textContent: Send,
                        height: 50,
                        onPressed: () {
                          if (!accessAllowed) {
                            toast("Sorry");
                            return;
                          }
                          if (email.text.isEmpty)
                            toast(Email + Field_Required);
                          else
                            isLoading = true;
                          forgotPwdApi();
                        },
                      )).paddingAll(16.0),
                ],
              ),
            )));
  }
}
