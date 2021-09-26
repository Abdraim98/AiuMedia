import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_flutter/Model/BlogModel.dart';
import 'package:news_flutter/Model/CategoryWiseNewListModel.dart';
import 'package:news_flutter/Model/DashboardModel.dart';
import 'package:news_flutter/Network/rest_apis.dart';
import 'package:news_flutter/Screens/SearchScreen.dart';
import 'package:news_flutter/Utils/Colors.dart';
import 'package:news_flutter/Utils/Common.dart';
import 'package:news_flutter/Utils/Images.dart';
import 'package:news_flutter/Utils/Strings.dart';
import 'package:news_flutter/Utils/constant.dart';

import 'NewsDetailScreen.dart';

class NewsListScreen extends StatefulWidget {
  static String tag = '/NewsListScreen';

  String title = '';
  int id;
  List recentPost;

  @override
  _NewsListScreenState createState() => _NewsListScreenState();

  NewsListScreen({this.id, this.title, this.recentPost});
}

class _NewsListScreenState extends State<NewsListScreen> {
  var categoriesWiseNewListing = List<Post>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchCategoriesWiseNewsData();
  }

  void fetchCategoriesWiseNewsData() {
    setState(() {
      isLoading = true;
    });
    Map req = {
      'category': widget.id,
      'filter': 'by_category',
      'paged': 0,
    };
    getBlogList(req).then((res) {
      if (!mounted) return;
      isLoading = false;
      setState(() {
        Iterable listing = res['posts'];
        categoriesWiseNewListing.clear();
        categoriesWiseNewListing.addAll(listing.map((model) => Post.fromJson(model)).toList());

        print(categoriesWiseNewListing.length);
        if (categoriesWiseNewListing.isEmpty) {
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
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    Widget newsList() {
      return Container(
        color: whiteColor,
        child: categoriesWiseNewListing.isNotEmpty
            ? ListView.builder(
          itemCount: categoriesWiseNewListing.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            Post post = categoriesWiseNewListing[i];
            return GestureDetector(
              onTap: () {
                NewsDetailScreen(post).launch(context);
              },
              child: Container(
                width: width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.network(
                      post.image.validate(),
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
                            parseHtmlString(post.post_title.validate()),
                            style: boldTextStyle(color: DarkBlueColor, size: textSizeMedium),
                            maxLines: 2,
                          ),
                          8.height,
                          Text(post.readable_date.validate()),
                          8.height,
                          parseHtmlString(post.post_content.validate()).text(style: primaryTextStyle(color: kGrey400, size: textSizeSMedium), maxLines: 4),
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

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: app_Background,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: whiteColor,
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
                parseHtmlString(widget.title),
                style: boldTextStyle(color: textColorPrimary, size: 18),
              ),
              actions: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 30.0,
                      color: blackColor,
                    ),
                    onPressed: () {
                      SearchScreen(false).launch(context);
                    })
              ],
            ),
            body: SingleChildScrollView(
              child: newsList(),
            ),
          ),
          CircularProgressIndicator().center().visible(isLoading),
        ],
      ),
    );
  }
}
