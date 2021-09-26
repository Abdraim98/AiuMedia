import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_flutter/Model/BlogModel.dart';
import 'package:news_flutter/Screens/SignInScreen.dart';
import 'package:news_flutter/Screens/ViewCommentScreen.dart';
import 'package:news_flutter/Screens/WriteCommentScreen.dart';
import 'package:news_flutter/Utils/Colors.dart';
import 'package:news_flutter/Utils/Common.dart';
import 'package:news_flutter/Utils/Extensions.dart';
import 'package:news_flutter/Utils/Strings.dart';
import 'package:news_flutter/Utils/Widgets.dart';
import 'package:news_flutter/Utils/constant.dart';
import 'package:news_flutter/Utils/wordpressContent/external/HearthisAtWidget.dart';
import 'package:news_flutter/Utils/wordpressContent/external/IssuuWidget.dart';
import 'package:news_flutter/Utils/wordpressContent/external/JWPlayerWidget.dart';
import 'package:news_flutter/Utils/wordpressContent/external/SoundCloudWidget.dart';
import 'package:news_flutter/Utils/wordpressContent/external/YouTubeWidget.dart';
import 'package:news_flutter/Utils/wordpressContent/model/SimpleArticle.dart';
import 'package:news_flutter/Utils/wordpressContent/wp_content.dart';

class NewsDetailScreen extends StatefulWidget {
  Post post;

  @override
  NewsDetailScreenState createState() => NewsDetailScreenState();

  NewsDetailScreen(this.post);
}

class NewsDetailScreenState extends State<NewsDetailScreen> {
  bool isLoading = false;
  String newsTitle = '';

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
    changeStatusColor(Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    //changeStatusColor(Colors.transparent);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: context.height() * 0.55,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(widget.post.image.validate(), fit: BoxFit.cover),
                collapseMode: CollapseMode.parallax,
                title: Text(
                  parseHtmlString(widget.post.post_title.validate()),
                  style: boldTextStyle(size: textSizeNormal),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ).visible(innerBoxIsScrolled).paddingOnly(left: isIos ? 16 : 0),
              ),
              backgroundColor: Colors.white,
              leading: BackButton(
                color: innerBoxIsScrolled ? Colors.black : Colors.white,
                onPressed: () {
                  finish(context);
                },
              ),
            ),
          ];
        },
        body: Container(
          height: context.height(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                10.height,
                '${parseHtmlString(widget.post.post_title.validate())}'.text(style: boldTextStyle(size: textSizeLarge, color: textColorPrimary), maxLines: 5),
                10.height,
                Text(widget.post.readable_date.validate()),
                10.height,
                //Text(widget.post.post_content.validate().replaceAll('&lt;', '<').replaceAll('&gt;', '>').replaceAll('&quot;', '"')),
                WPContent(
                  widget.post.post_content.validate().replaceAll('&lt;', '<').replaceAll('&gt;', '>').replaceAll('&quot;', '"'),
                  youtubeEmbedWidget: YouTubeEmbedWidget(),
                  soundcloudEmbedWidget: SoundCloudEmbedWidget('', ''),
                  issuuEmbedWidget: IssueEmbedWidget(),
                  hearthisAtWidget: HearthisAtEmbedWidget('', ''),
                  jwPlayerWidget: JWPlayerEmbedWidget(),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      NewsButton(
                        textContent: Write_Comment,
                        onPressed: () async {
                          await getBool(IS_LOGGED_IN) ? WriteCommentScreen(id: widget.post.ID).launch(context) : SignInScreen().launch(context);
                        },
                      ),
                      20.height,
                      NewsButton(
                        textContent: View_Comment,
                        onPressed: () {
                          ViewCommentScreen(id: widget.post.ID).launch(context);
                        },
                      ),
                    ],
                  ).paddingOnly(top: 16.0, bottom: 16.0),
                ).visible(widget.post.post_content != null),
              ],
            ).paddingAll(20.0),
          ),
        ),
      ),
    );
  }
}

class YouTubeEmbedWidget extends YouTubeWidget {
  @override
  Widget buildWithVideoId(BuildContext context, String videoId) {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          child: HtmlWidget(
            '<html><iframe src="https://www.youtube.com/embed/$videoId" width="560" height="315"></iframe></html>',
            webView: true,
          ),
        ),
      ),
    );
  }
}

class IssueEmbedWidget extends IssuuWidget {
  @override
  Widget buildWithPDF(BuildContext context, SimpleArticle pdf) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: RaisedButton(
            padding: EdgeInsets.all(10.0),
            color: Colors.green,
            child: Container(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(
                "View PDF",
                style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white),
              ),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (context) {
                  return Container(
                    child: Text(pdf.paragraphRawContent),
                  );
                },
              ));
            }),
      ),
    );
  }
}

class SoundCloudEmbedWidget extends SoundCloudWidget {
  final String title;
  final String subtitle;

  SoundCloudEmbedWidget(this.title, this.subtitle);

  @override
  Widget buildWithTrackId(BuildContext context, String trackId, String embedCode) {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 30.0),
      child: Container(
        child: Column(
          children: <Widget>[Text(title), Text(subtitle), Text(trackId)],
        ),
      ),
    );
  }
}

class HearthisAtEmbedWidget extends HearthisAtWidget {
  final String title;
  final String subtitle;

  HearthisAtEmbedWidget(this.title, this.subtitle);

  @override
  Widget buildWithTrackId(BuildContext context, String trackId) {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 30.0),
      child: Container(
        child: Column(
          children: <Widget>[Text(title), Text(subtitle), Text(trackId)],
        ),
      ),
    );
  }
}

class JWPlayerEmbedWidget extends JWPlayerWidget {
  @override
  Widget buildWithMediaId(BuildContext context, String mediaId) {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          child: Text(mediaId),
        ),
      ),
    );
  }
}
