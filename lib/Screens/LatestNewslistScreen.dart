import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_flutter/Model/BlogModel.dart';
import 'package:news_flutter/Model/DashboardModel.dart';
import 'package:news_flutter/Utils/Colors.dart';
import 'package:news_flutter/Utils/Common.dart';
import 'package:news_flutter/Utils/Extensions.dart';
import 'package:news_flutter/Utils/constant.dart';

import 'NewsDetailScreen.dart';
import 'SearchScreen.dart';

class LatestNewsListScreen extends StatefulWidget {
  String title = '';
  List recentPost;

  @override
  LatestNewsListScreenState createState() => LatestNewsListScreenState();

  LatestNewsListScreen({this.title, this.recentPost});
}

class LatestNewsListScreenState extends State<LatestNewsListScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    changeStatusColor(transparentColor);
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(white_color);
  }

  @override
  Widget build(BuildContext context) {
    Widget newsList() {
      return Container(
        color: whiteColor,
        child: widget.recentPost.isNotEmpty
            ? ListView.builder(
                itemCount: widget.recentPost.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  Post recentPost = widget.recentPost[i];
                  return GestureDetector(
                    onTap: () {
                      NewsDetailScreen(recentPost).launch(context);
                    },
                    child: Container(
                      width: context.width(),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.network(
                            recentPost.image.validate(),
                            height: context.height() * 0.17,
                            width: context.width() * 0.37,
                            fit: BoxFit.cover,
                          ).cornerRadiusWithClipRRect(5.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                4.height,
                                Text(
                                  parseHtmlString(recentPost.post_title.validate()),
                                  style: boldTextStyle(color: DarkBlueColor, size: textSizeMedium),
                                  maxLines: 2,
                                ),
                                8.height,
                                Text(recentPost.readable_date.validate()),
                                8.height,
                                parseHtmlString(recentPost.post_content.validate()).text(style: primaryTextStyle(color: kGrey400, size: textSizeSMedium), maxLines: 4),
                              ],
                            ).paddingOnly(left: 8.0, right: 4.0),
                          )
                        ],
                      ),
                    ).paddingAll(16.0),
                  );
                },
              ).paddingOnly(top: 16.0, bottom: 16.0)
            : Container(),
      );
    }

    return Scaffold(
      backgroundColor: app_Background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 5.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 30, color: blackColor),
            onPressed: () {
              finish(context);
            }),
        title: Text(
          parseHtmlString(widget.title),
          style: boldTextStyle(color: textColorPrimary, size: 18),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search, size: 30.0, color: blackColor),
              onPressed: () {
                SearchScreen(false).launch(context);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: newsList(),
      ),
    );
  }
}
