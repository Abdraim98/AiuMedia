import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_flutter/Network/rest_apis.dart';
import 'package:news_flutter/Utils/Colors.dart';
import 'package:news_flutter/Utils/Extensions.dart';
import 'package:news_flutter/Utils/Strings.dart';
import 'package:news_flutter/Utils/Widgets.dart';
import 'package:news_flutter/Utils/constant.dart';

class WriteCommentScreen extends StatefulWidget {
  int id;
  @override
  _WriteCommentScreenState createState() => _WriteCommentScreenState();

  WriteCommentScreen({this.id});
}

class _WriteCommentScreenState extends State<WriteCommentScreen> {

  var commentCont = TextEditingController();
  bool isLoading = false;
  var userName = '';
  var userEmail = '';
  int userId;

  @override
  void initState() {
    super.initState();
    init();
  }


  init() async {
    changeStatusColor(white_color);
    userName = await getBool(IS_LOGGED_IN) ? await getString(USERNAME) : '';
    userEmail = await getBool(IS_LOGGED_IN) ? await getString(USER_EMAIL) : '';
    userId = await getBool(IS_LOGGED_IN) ? await getString(USER_ID) : 0;
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(Colors.transparent);
  }

  postCommentApi() async {
    hideKeyboard(context);
    var request = {
      'comment_content': commentCont.text,
      'comment_post_ID': widget.id,
    };
    print(request);
    setState(() {
      isLoading = true;
    });
    postComment(request).then((res) {
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
      print(res);
      toast(res['message']);
      finish(context);
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      toast(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: white_color,
              elevation: 5.0,
              title: Write_Comment.text(style: boldTextStyle(color: textColorPrimary, size: 18)),
              centerTitle: true,
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: blackColor,
                  ),
                  onPressed: () {
                    finish(context);
                  }),
            ),
            backgroundColor: app_Background,
            body: SingleChildScrollView(
              child: Expanded(
                child: Column(
                  children: <Widget>[
                    16.height,
                    Container(
                      decoration: boxDecoration(bgColor: white_color, radius: 0.0, showShadow: true),
                      height: 100,
                      child: TextField(
                        controller: commentCont,
                        scrollPadding: EdgeInsets.all(8.0),
                        style: TextStyle(color: textColorPrimary, fontSize: textSizeMedium.toDouble()),
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: Comment,
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
                      onPressed: () {
                        if (!accessAllowed) {
                          toast("Sorry");
                          return;
                        }
                        if (commentCont.text.isEmpty)
                          toast('Comment' + Field_Required);
                        else {
                          isLoading = true;
                          postCommentApi();
                        }
                      },
                    )
                  ],
                ).paddingAll(16.0),
              ),
            ),
          ),
          CircularProgressIndicator().center().visible(isLoading),
        ],
      ),
    );
  }
}
