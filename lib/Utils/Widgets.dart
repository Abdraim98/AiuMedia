import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_flutter/Utils/Colors.dart';
import 'package:news_flutter/Utils/constant.dart';
import 'package:share/share.dart';

import 'Strings.dart';

void onShareTap(BuildContext context) async {
  final RenderBox box = context.findRenderObject();
  Share.share('My App Name', subject: 'Share $App_Name App', sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
}

BoxDecoration boxDecoration(
    {double radius = 1.0,
      Color color = Colors.transparent,
      Color bgColor = white_color,
      double borderWidth = 1.0,
      var showShadow = false}) {
  return BoxDecoration(
      color: bgColor,
      //gradient: LinearGradient(colors: [bgColor, whiteColor]),
      boxShadow: showShadow
          ? [BoxShadow(color: shadow_color, blurRadius: 10, spreadRadius: 3)]
          : [BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color,width: borderWidth),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

class EditText extends StatefulWidget {
  var isPassword;
  var isSecure;
  int fontSize;
  var textColor;
  var fontFamily;
  var iconName;
  var text;
  var maxLine;
  var hintText;
  bool enabled;
  TextEditingController mController;

  VoidCallback onPressed;

  EditText(
      {var this.fontSize = textSizeMedium
        ,
        var this.textColor = textColorSecondary,
        var this.isPassword = true,
        var this.isSecure = false,var this.text="",var this.mController,var this.maxLine=1,var this.iconName = '',var this.hintText = '',var this.enabled = true});

  @override
  State<StatefulWidget> createState() {
    return EditTextState();
  }
}

class EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isSecure) {
      return TextFormField(
        controller:widget.mController,
        obscureText: widget.isPassword,
        cursorColor: primaryColor,
        maxLines: widget.maxLine,
        enabled: widget.enabled,
        style: TextStyle(
            fontSize: widget.fontSize.toDouble(),
            color: textColorPrimary),
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: Icon(widget.iconName,size: 30,color: textColorSecondary,),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black12),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
      );
    } else {
      return TextFormField(
          controller:widget.mController,
          obscureText: widget.isPassword,
          cursorColor: primaryColor,
          enabled: widget.enabled,
        style: TextStyle(color: textColorPrimary,fontSize: widget.fontSize.toDouble()),
          decoration: InputDecoration(
            suffixIcon:  GestureDetector(
              onTap: () {
                setState(() {
                  widget.isPassword = !widget.isPassword;
                });
              },
              child: Icon(
                  widget.isPassword ? Icons.visibility : Icons.visibility_off,color: primaryColor,),
            ),
            prefixIcon: Icon(widget.iconName,size: 30,color: textColorSecondary,),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        autofocus: false,
      );
    }
  }

  @override
  State<StatefulWidget> createState() {
    return null;
  }
}

class SimpleEditText extends StatefulWidget {
  var isPassword;
  var isSecure;
  var fontSize;
  var textColor;
  var fontFamily;
  var text;
  var maxLine;
  var hintText;
  bool enabled;

  TextEditingController mController;

  VoidCallback onPressed;

  SimpleEditText(
      {var this.fontSize = textSizeNormal,
        var this.textColor = textColorPrimary,
        var this.isPassword = false,
        var this.isSecure = true,
        var this.text = '',
        var this.mController,
        var this.maxLine = 1,
        var this.hintText = '',
        var this.enabled = true,
      });

  @override
  State<StatefulWidget> createState() {
    return SimpleEditTextState();
  }
}

class SimpleEditTextState extends State<SimpleEditText> {
  @override
  Widget build(BuildContext context) {

    return TextFormField(
        controller: widget.mController,
        obscureText: widget.isPassword,
        enabled: widget.enabled,
        style: TextStyle(color: textColorPrimary, fontSize: 16),
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: EdgeInsets.fromLTRB(8, 8, 4, 4),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          border: new UnderlineInputBorder(
              borderSide: new BorderSide(
                  color: Colors.red
              )
          ),
        ));
  }

  @override
  State<StatefulWidget> createState() {
    return null;
  }
}

class NewsButton extends StatefulWidget {
  static String tag = '/NewsButton';
  var textContent;
  VoidCallback onPressed;
  var isStroked=false;
  var height=50.0;

  NewsButton({@required this.textContent, @required this.onPressed,this.isStroked=false,this.height=45.0});
  @override
  NewsButtonState createState() => NewsButtonState();
}

class NewsButtonState extends State<NewsButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: widget.height,
        padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
        alignment: Alignment.center,
        child: Text(widget.textContent,textAlign: TextAlign.center,style: primaryTextStyle(color: white_color,size: textSizeLargeMedium),),
        decoration: widget.isStroked?boxDecoration(bgColor: Colors.transparent,color: primaryColor):boxDecoration(bgColor: primaryColor,radius: 4),
      ),
    ) ;
  }
}


Container editText1(var hintText, {TextEditingController controller,isPassword = false}) {
  return Container(
    decoration: boxDecoration(radius: 0.0, showShadow: true, bgColor: white_color),
    child: TextFormField(
      style: TextStyle(color: textColorPrimary,fontSize: textSizeMedium.toDouble()),
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(24, 18, 24, 18),
        hintText: hintText,
        filled: true,
        fillColor: white_color,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: white_color, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: white_color, width: 0.0),
        ),
      ),
    ),
  );
}

enum ConfirmAction { CANCEL, ACCEPT }

Future<ConfirmAction> showConfirmDialogs(context, msg, positiveText, negativeText) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Text(msg, style: TextStyle(fontSize: 16)),
        actions: <Widget>[
          FlatButton(
            child: Text(negativeText),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
          FlatButton(
            child: Text(positiveText),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.ACCEPT);
            },
          )
        ],
      );
    },
  );
}

Widget getLoadingProgress(loadingProgress) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes : null,
      ),
    ),
  );
}

Widget backIcon(var color, var icon, var iconColor) {
  return Container(width: 38, height: 38, decoration: boxDecoration(bgColor: color, radius: 10, color: white_color, showShadow: false), child: Icon(icon, color: iconColor));
}