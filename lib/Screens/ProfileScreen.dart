import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_flutter/Network/rest_apis.dart';
import 'package:news_flutter/Screens/BottomNavigationScreen.dart';
import 'package:news_flutter/Utils/Colors.dart';
import 'package:news_flutter/Utils/Extensions.dart';
import 'package:news_flutter/Utils/Images.dart';
import 'package:news_flutter/Utils/Strings.dart';
import 'package:news_flutter/Utils/Widgets.dart';
import 'package:news_flutter/Utils/constant.dart';

class ProfileScreen extends StatefulWidget {
  bool isTab = false;
  @override
  ProfileScreenState createState() => ProfileScreenState();

  ProfileScreen(this.isTab);
}


class ProfileScreenState extends State<ProfileScreen> {
  var mProfileImage = '';
  var imageFile = '';
  bool isLoading = false;
  File mSelectedImage;
  String avatar = '';


  var fNameCont = TextEditingController();
  var lNameCont = TextEditingController();
  var emailCont = TextEditingController();
  var usernameCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    changeStatusColor(white_color);
//    var g = await getString(PROFILE_IMAGE);
//    if (g.isNotEmpty) {
//      mProfileImage = g;
//    } else {
//      mProfileImage = await getString(AVATAR);
//    }

    if (getString(PROFILE_IMAGE) != null) {
      avatar = await getString(PROFILE_IMAGE);
    } else {
      avatar = await getString(AVATAR);
    }

    fNameCont.text = await getBool(IS_LOGGED_IN) ? await getString(FIRST_NAME) : '';
    lNameCont.text = await getBool(IS_LOGGED_IN) ? await getString(LAST_NAME) : '';
    emailCont.text = await getBool(IS_LOGGED_IN) ? await getString(USER_EMAIL) : '';
    usernameCont.text = await getBool(IS_LOGGED_IN) ? await getString(USERNAME) : '';

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(white_color);
  }

  @override
  Widget build(BuildContext context) {

    saveUser() async {
      setState(() {
        isLoading = true;
      });
      hideKeyboard(context);

      var request = {
        'email': emailCont.text,
        'first_name': fNameCont.text,
        'last_name': lNameCont.text,
        'user_name':usernameCont.text
      };
      updateUser(await getInt(USER_ID), request).then((res) {
        if (!mounted) return;
        setState(() {
          isLoading = false;
        });
        print(res);
        setString(FIRST_NAME, res['first_name']);
        setString(LAST_NAME, res['last_name']);
        setString(USER_EMAIL, res['email']);

        toast('Profile Saved');
        BottomNavigationScreen().launch(context);
      }).catchError((error) {
        toast(error.toString());
        setState(() {
          isLoading = false;
        });
      });
    }

//    pickImage() async {
//      File image = await ImagePicker.pickImage(source: ImageSource.gallery);
//
//      setState(() {
//        mSelectedImage = image;
//      });
//
//      if (mSelectedImage != null) {
//        ConfirmAction res = await showConfirmDialogs(
//            context, 'Are you sure want to upload image?', 'Yes', 'No');
//
//        if (res == ConfirmAction.ACCEPT) {
//          setState(() {
//            isLoading = true;
//          });
//          var base64Image = base64Encode(mSelectedImage.readAsBytesSync());
//          var request = {'base64_img': base64Image};
//          print(request);
//
//          await saveProfileImage(request).then((res) async {
//            if (!mounted) return;
//            setState(() {
//              isLoading = false;
//            });
//            toast('Saved Profile Image');
//            if (res['profile_image'] != null) {
//              setString(PROFILE_IMAGE, res['profile_image']);
//            }
//
//          }).catchError((error) {
//            setState(() {
//              isLoading = false;
//            });
////            toast(error.toString());
//          });
//        }
//      }
//    }
//
//    Widget profileImage = ClipRRect(
//      borderRadius: BorderRadius.circular(100),
////      child: mSelectedImage == null
////          ? avatar.isEmpty
////          ? SizedBox()
////          : Image.network(
////        mProfileImage,
////        width: 120,
////        height: 120,
////        fit: BoxFit.fill,
////        loadingBuilder: (context, child, loadingProgress) {
////          if (loadingProgress == null) return child;
////          return getLoadingProgress(loadingProgress);
////        },
////      )
////          : Image.file(
////        mSelectedImage,
////        width: 120,
////        height: 120,
////        fit: BoxFit.contain,
////      ),
//        child: mSelectedImage == null ? Image.network(mProfileImage,width: 120,height: 120,fit: BoxFit.fill,) : Image.file(mSelectedImage,width: 120,height: 120,fit: BoxFit.fill,)
//    );

    pickImage() async {
      File image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        mSelectedImage = image;
      });

      if (mSelectedImage != null) {
        ConfirmAction res = await showConfirmDialogs(
            context, 'Are you sure want to upload image?', 'Yes', 'No');

        if (res == ConfirmAction.ACCEPT) {
          var base64Image = base64Encode(mSelectedImage.readAsBytesSync());
          var request = {'base64_img': base64Image};
          setState(() {
            isLoading = true;
          });
          await saveProfileImage(request).then((res) async {
            if (!mounted) return;
            setState(() {
              isLoading = false;
            });
            if (res['profile_image'] != null) {
              setString(PROFILE_IMAGE, res['profile_image']);
            }
            toast(res['message']);
          }).catchError((error) {
            setState(() {
              isLoading = false;
            });
            toast(error.toString());
          });
        }
      }
    }

    Widget profileImage = ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: mSelectedImage == null
          ? avatar.isEmpty
          ? Image.asset(
        User_Profile,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      )
          : Image.network(
        avatar,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return getLoadingProgress(loadingProgress);
        },
      )
          : Image.file(
        mSelectedImage,
        width: 120,
        height: 120,
        fit: BoxFit.contain,
      ),
    ).onTap(() => pickImage());

    return Stack(
      children: [
        Scaffold(
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
                  }).visible(widget.isTab == false),
              title: Text(
                Profile,
                style: boldTextStyle(color: textColorPrimary, size: 18),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: boxDecoration(bgColor: white_color, showShadow: true),
                    child: Column(
                      children: [
                        16.height,
                        8.width,
                        Stack(
                          alignment: Alignment.bottomRight,
                          children:[
                            Container(
                              height: 140,
                              width: 140,
                              decoration: boxDecoration(radius: 80, color: primaryColor, borderWidth: 4.0),
                              child: profileImage.paddingAll(4.0),
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                  Border.all(color: primaryColor, width: 2),
                                  color: white_color),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.camera_alt,
                                    size: 20,
                                    color: primaryColor,
                                  ),
                                  onPressed: (() {
                                    pickImage();
                                  })),
                            )
                          ]
                        ),
                        8.width,
                        16.height,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(First_Name, style: secondaryTextStyle(color: textColorSecondary, size: textSizeMedium)),
                            EditText(
                              iconName: Icons.supervised_user_circle,
                              isPassword: false,
                              mController: fNameCont,
                              hintText: First_Name,
                            ),
                            16.height,
                            Text(Last_Name, style: secondaryTextStyle(color: textColorSecondary, size: textSizeMedium)),
                            EditText(
                              iconName: Icons.supervised_user_circle,
                              isPassword: false,
                              mController: lNameCont,
                              hintText: Last_Name,
                            ),
                            16.height,
                            Text(UserName, style: secondaryTextStyle(color: textColorSecondary, size: textSizeMedium)),
                            EditText(
                              iconName: Icons.supervised_user_circle,
                              isPassword: false,
                              mController: usernameCont,
                              hintText: UserName,
                              enabled: false,

                            ),
                            16.height,
                            Text(Email, style: secondaryTextStyle(color: textColorSecondary, size: textSizeMedium)),
                            EditText(
                              iconName: Icons.email,
                              isPassword: false,
                              mController: emailCont,
                              hintText: Last_Name,
                            ),
                            16.height
                          ],
                        ),
                      ],
                    ).paddingOnly(left: 16.0,right: 16.0),
                  ).paddingOnly(top: 24.0, bottom: 16.0),
                  Container(
                      width: context.width(),
                      decoration: boxDecoration(bgColor: white_color, showShadow: true),
                      child: NewsButton(
                        textContent: Save,
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
                            toast(Email + Field_Required);
                          else if (usernameCont.text.isEmpty)
                            toast(UserName + Field_Required);
                          else {
                            saveUser();
                          }
                        },
                      ).paddingAll(16.0))
                ],
              ).paddingOnly(left: 16.0,right: 16.0),
            )),
        CircularProgressIndicator().center().visible(isLoading),
      ],
    );
  }

  void openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture as String;
    });
    finish(context);
  }

  Future<void> showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text("Gallery").onTap(() {
                      openGallery(context);
                    }),
                    Padding(padding: EdgeInsets.all(16.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
//                        _openCamera(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }
}
