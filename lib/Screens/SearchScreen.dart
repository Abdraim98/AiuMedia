import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_flutter/Model/BlogModel.dart';
import 'package:news_flutter/Network/rest_apis.dart';
import 'package:news_flutter/Screens/NewsDetailScreen.dart';
import 'package:news_flutter/Utils/Colors.dart';
import 'package:news_flutter/Utils/Common.dart';
import 'package:news_flutter/Utils/Extensions.dart';
import 'package:news_flutter/Utils/Strings.dart';
import 'package:news_flutter/Utils/constant.dart';

class SearchScreen extends StatefulWidget {
  bool isTab = false;

  @override
  _SearchScreenState createState() => _SearchScreenState();

  SearchScreen(this.isTab);
}

class _SearchScreenState extends State<SearchScreen> {

  var searchList = List<Post>();
  var searchCont = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    changeStatusColor(white_color);
  }

  void getSearchListing() async {
    setState(() {
      isLoading = true;
    });

    Map req = {
      "text": searchCont.text,
      "page": 0,
    };
    getSearchBlogList(req).then((res) {
      if (!mounted) return;
      isLoading = false;
      setState(() {
        Iterable listing = res['posts'];
        searchList = listing.map((model) => Post.fromJson(model)).toList();
        print(searchList);
        print(searchList.length);
        if (searchList.length == 0) {
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
    changeStatusColor(white_color);
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width();

    Widget newsList() {
      return searchList.isNotEmpty
          ? ListView.builder(
        itemCount: searchList.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) {
          Post post = searchList[i];
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
          : Container();
    }

    changeStatusColor(white_color);

    Widget searchText() {
      return Container(
        height: 80,
        child: TextField(
            textAlignVertical: TextAlignVertical.center,
            controller: searchCont,
            textInputAction: TextInputAction.done,
            onSubmitted: (String searchTxt) {
              getSearchListing();
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: white_color,
              border: InputBorder.none,
              hintText: Search,
              suffixIcon: Icon(
                Icons.search,
                color: primaryColor,
              ).paddingAll(16),
              contentPadding: EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8.0, right: 16.0),
            )).cornerRadiusWithClipRRect(20),
        alignment: Alignment.center,
      ).cornerRadiusWithClipRRect(10).paddingAll(16.0);
    }

    return SafeArea(
      child: Stack(
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
                Search,
                style: boldTextStyle(color: textColorPrimary, size: 18),
              ),
            ),
            backgroundColor: app_Background,
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[searchText(), newsList()],
              ),
            ),
          ),
          CircularProgressIndicator().center().visible(isLoading),
        ],
      )
    );
  }
}
