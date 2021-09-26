import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_flutter/Model/ViewCommentModel.dart';
import 'package:news_flutter/Network/rest_apis.dart';
import 'package:news_flutter/Utils/Colors.dart';
import 'package:news_flutter/Utils/Common.dart';
import 'package:news_flutter/Utils/Extensions.dart';
import 'package:news_flutter/Utils/Strings.dart';
import 'package:news_flutter/Utils/Widgets.dart';
import 'package:news_flutter/Utils/constant.dart';

class ViewCommentScreen extends StatefulWidget {
  int id;

  @override
  _ViewCommentScreenState createState() => _ViewCommentScreenState();

  ViewCommentScreen({this.id});
}

class _ViewCommentScreenState extends State<ViewCommentScreen> {
//  List<CommentModel> commentLists;

  var commentLists = List<ViewCommentModel>();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    changeStatusColor(white_color);
    print(widget.id);
    getCommentData();
  }

  void getCommentData() async {
    setState(() {
      isLoading = true;
    });
    await getCommentList(widget.id).then((res) {
      if (!mounted) return;
      isLoading = false;
      setState(() {
        Iterable commentList = res;
        commentLists = commentList.map((model) => ViewCommentModel.fromJson(model)).toList();
        print(commentLists);
        print(commentLists.length);
        if (commentLists.length == 0) {
          toast(noRecord);
        }
      });
    }).catchError((error) {
      if (!mounted) return;
      setState(() {
        isLoading = false;
        toast(error.toString());
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width();

    Widget commentList(List<ViewCommentModel> list) {
      changeStatusColor(white_color);
      return Container(
        color: white_color,
        child: ListView.builder(
          itemCount: list.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                width: width,
                child: Column(
                  children: <Widget>[
                    4.height,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 20,
                          width: 20,
                          decoration: boxDecoration(bgColor: getColorFromHex(categoryColors[i % categoryColors.length]), radius: 10.0),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    list[i].author_name,
                                    style: boldTextStyle(color: Colors.blueAccent, size: textSizeMedium),
                                    maxLines: 2,
                                  ),
                                  Text(list[i].date != null ? convertDate(list[i].date) : ''),
                                ],
                              ),
                              4.height,
                              Text(
                                parseHtmlString(
                                  list[i].content.rendered != null ? list[i].content.rendered : '',
                                ),
                                style: secondaryTextStyle(color: DarkBlueColor, size: textSizeSMedium),
                                maxLines: 2,
                              ),
                            ],
                          ).paddingOnly(left: 8.0, right: 4.0),
                        )
                      ],
                    ),
                    Divider(
                      color: light_grayColor,
                      thickness: 1.5,
                    )
                  ],
                ).paddingOnly(left: 8.0, right: 8.0),
              ).paddingAll(4.0),
            );
          },
        ).paddingOnly(top: 8.0, bottom: 8.0),
      );
    }

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: white_color,
              elevation: 5.0,
              title: Comment.text(style: boldTextStyle(color: textColorPrimary, size: 18)),
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
            body: SingleChildScrollView(
              child: commentList(commentLists),
            ),
          ),
          CircularProgressIndicator().center().visible(isLoading),
        ],
      ),
    );
  }
}
