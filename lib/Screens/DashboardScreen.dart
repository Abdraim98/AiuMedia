import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_flutter/Model/BlogModel.dart';
import 'package:news_flutter/Model/CategoryModel.dart';
import 'package:news_flutter/Model/DashboardModel.dart';
import 'package:news_flutter/Model/SliderModel.dart';
import 'package:news_flutter/Network/rest_apis.dart';
import 'package:news_flutter/Screens/BottomNavigationScreen.dart';
import 'package:news_flutter/Screens/CategoryScreen.dart';
import 'package:news_flutter/Screens/LatestNewslistScreen.dart';
import 'package:news_flutter/Screens/NewsDetailScreen.dart';
import 'package:news_flutter/Screens/ProfileScreen.dart';
import 'package:news_flutter/Screens/SettingScreen.dart';
import 'package:news_flutter/Screens/SignInScreen.dart';
import 'package:news_flutter/Utils/Colors.dart';
import 'package:news_flutter/Utils/Common.dart';
import 'package:news_flutter/Utils/Extensions.dart';
import 'package:news_flutter/Utils/Images.dart';
import 'package:news_flutter/Utils/SliderWidget.dart';
import 'package:news_flutter/Utils/Strings.dart';
import 'package:news_flutter/Utils/Widgets.dart';
import 'package:news_flutter/Utils/constant.dart';
import 'package:open_appstore/open_appstore.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardScreen extends StatefulWidget {
  static String tag = '/DashboardScreen';

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  var mCategory = List<CategoriesModel>();
  var categoriesWiseNewListing = List<Post>();
  var featuredNewsListing = List<Post>();
  var recentNewsListing = List<Post>();
  var mSliderImages = List<SliderModel>();

  List<Widget> tabs = List();
  var listImg = List();
  var scrollController = new ScrollController();

  var arrSideMenu = [Home, Latest, Categories, Contact];
  var arrSideMenuIcon = [ic_home, ic_News, ic_Categories, ic_Contact_us];

  var userName = '';
  var userEmail = '';
  var mProfileImage = '';
  int id;
  int page = 0;
  bool isLastPage = false;
  bool isLoading = false;
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    changeStatusColor(white_color);
    init();
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(primaryColor);
  }

  init() async {
    setHomeData();
    fetchDashboardData();
    fetchCategoryData();
    isLogin = await getBool(IS_LOGGED_IN);
    changeStatusColor(white_color);
    scrollController.addListener(() {
      scrollHandler();
    });
  }

  scrollHandler() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent && !isLastPage) {
      page++;
      fetchCategoriesWiseNewsData(id);
    }
  }

  void fetchDashboardData() async {
    setState(() {
      isLoading = true;
    });

    getDashboardApi().then((res) {
      if (!mounted) return;
      isLoading = false;
      setState(() {

        Iterable listFeatured = res['feature_post'];
        featuredNewsListing.addAll(listFeatured.map((model) => Post.fromJson(model)).toList());

        Iterable listRecent = res['recent_post'];
        recentNewsListing.addAll(listRecent.map((model) => Post.fromJson(model)).toList());

        Iterable sliderImg = res['banner'];
        mSliderImages.addAll(sliderImg.map((model) => SliderModel.fromJson(model)).toList());
      });
    }).catchError((error) {
      if (!mounted) return;
      setState(() {
        isLoading = false;
        toast(error.toString());
      });
    });
  }

  void fetchCategoryData() async {
    setState(() {
      isLoading = true;
    });
    getCategories().then((res) {
      if (!mounted) return;
      isLoading = false;
      Iterable category = res;
      mCategory.addAll(category.map((model) => CategoriesModel.fromJson(model)).toList());
      tabs.clear();
      tabs.add(Container(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          Home,
          style: secondaryTextStyle(color: textColorPrimary, size: textSizeLargeMedium),
        ),
      ));

      mCategory.forEach((element) {
        tabs.add(Container(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            parseHtmlString(element.name.validate()),
            style: secondaryTextStyle(color: textColorPrimary, size: textSizeLargeMedium),
          ),
        ));
      });

      print(tabs.length);
      setState(() {});
    }).catchError((error) {
      if (!mounted) return;
      setState(() {
        isLoading = false;
        toast(error.toString());
      });
    });
  }

  void fetchCategoriesWiseNewsData(int id) {
    setState(() {
      isLoading = true;
    });
    Map req = {
      'category': id,
      'filter': 'by_category',
      'paged': page,
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

  void setHomeData() async {
    userName = await getBool(IS_LOGGED_IN) ? await getString(USERNAME) : '';
    userEmail = await getBool(IS_LOGGED_IN) ? await getString(USER_EMAIL) : '';
    var g = await getString(PROFILE_IMAGE);
    if (g.isNotEmpty) {
      mProfileImage = g;
    } else {
      mProfileImage = await getString(AVATAR);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width();

    void onShareTap() async {
      final RenderBox box = context.findRenderObject();
      Share.share('My App Name', subject: 'Share $App_Name App', sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }

    Widget latestNews(String title) {
      return Stack(children: [
        Column(
          children: [
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: boldTextStyle(color: textColorPrimary, size: textSizeLargeMedium)).paddingOnly(left: 8.0),
                Text('Все', style: primaryTextStyle(color: textColorPrimary, size: textSizeLargeMedium)).paddingOnly(right: 8.0).onTap(() {
                  LatestNewsListScreen(title: title, recentPost: recentNewsListing).launch(context);
                }),
              ],
            ),
            16.height,
            Container(
              decoration: boxDecoration(radius: 5.0, bgColor: Colors.transparent),
              child: Container(
                child: StaggeredGridView.countBuilder(
                  scrollDirection: Axis.vertical,
                  itemCount: recentNewsListing.length > 4 ? 4 : recentNewsListing.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    Post recentPost = recentNewsListing[i];
                    return GestureDetector(
                      onTap: () {
                        NewsDetailScreen(recentPost).launch(context);
                      },
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.all(4.0),
                            width: width,
                            decoration: boxDecoration(radius: 5.0, bgColor: Colors.transparent, showShadow: true),
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Image.network(
                                  recentPost.image.validate(),
                                  fit: BoxFit.cover,
                                  height: 300,
                                  width: width,
                                ).cornerRadiusWithClipRRect(10.0),
                                Container(
                                  width: context.width(),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                                      color: blackColor.withOpacity(0.3)),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      width: width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(parseHtmlString(recentPost.post_title.validate()),
                                              style: boldTextStyle(color: white_color, size: textSizeLargeMedium), maxLines: 2),
                                          4.height,
                                          Text(recentPost.readable_date.validate(), style: primaryTextStyle(color: white_color, size: textSizeSMedium))
                                        ],
                                      ).paddingOnly(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  crossAxisCount: 2,
                  staggeredTileBuilder: (index) {
                    return StaggeredTile.fit(1);
                  },
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  /*gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                    ),*/
                ),
              ),
            )
          ],
        )
      ]);
    }

    Widget carousel = CarouselSlider(
      viewportFraction: 1.0,
      height: 250,
      enlargeCenterPage: false,
      autoPlayCurve: Curves.bounceInOut,
      reverse: true,
      autoPlay: false,
      scrollDirection: Axis.horizontal,
      items: mSliderImages.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0,vertical: 2.0),
              child: Image.network(
                i.image.validate(),
                height: 180,
                width: width,
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRect(10.0),
            );
          },
        );
      }).toList(),
    );

    Widget newsList(int index) {
      if (index == 0) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                Text(
                  'Просматривайте новости дня в одно касание',
                  style: boldTextStyle(color: textColorPrimary, size: textSizeLarge),
                ),
                16.height,
//                Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: MediaQuery.of(context).size.width * 0.62,
//                  color: Colors.transparent,
//                  child: PageView(
//                      children: listImg.asMap().map((i, e) {
//                            return MapEntry(i, Slider(file: mSliderImages[i].image));
//                          })
//                          .values
//                          .toList()),
//                ),
                carousel.visible(mSliderImages.isNotEmpty),
                16.height,
                latestNews(Latest_News),
                16.height,
                Text(Featured_News, style: boldTextStyle(color: textColorPrimary, size: textSizeLargeMedium)).paddingOnly(left: 8.0),
                featuredNewsListing.isNotEmpty
                    ? ListView.builder(
                        itemCount: featuredNewsListing.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          Post featuredPost = featuredNewsListing[i];
                          return GestureDetector(
                            onTap: () {
                              NewsDetailScreen(featuredPost).launch(context);
                            },
                            child: Container(
                              width: width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Image.network(
                                    featuredPost.image.validate(),
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
                                          parseHtmlString(featuredPost.post_title.validate()),
                                          style: boldTextStyle(color: DarkBlueColor, size: textSizeMedium),
                                          maxLines: 2,
                                        ),
                                        8.height,
                                        Text(featuredPost.readable_date.validate()),
                                        8.height,
                                        parseHtmlString(featuredPost.post_content.validate())
                                            .text(style: primaryTextStyle(color: kGrey400, size: textSizeSMedium), maxLines: 3),
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
              ],
            ),
          ),
        );
      } else {
        return Container(
          decoration: boxDecoration(bgColor: white_color, showShadow: true),
          child: SingleChildScrollView(
            child: Column(
              children: [
                categoriesWiseNewListing.isNotEmpty
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
              ],
            ),
          ),
        );
      }
    }

    return SafeArea(
      child: DefaultTabController(
        length: (mCategory.length + 1),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: app_Background,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(115),
            child: Container(
              width: context.width(),
              decoration: boxDecoration(bgColor: white_color, showShadow: true),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.menu, size: 30, color: blackColor),
                        onPressed: () {
                          scaffoldKey.currentState.openDrawer();
                        },
                      ),
                      App_Name.text(style: boldTextStyle(color: textColorPrimary, size: textSizeLarge)),
                      IconButton(icon: Icon(Icons.filter_list, size: 30, color: blackColor), onPressed: () {}),
                    ],
                  ),
                  8.height,
                  Container(
                    child: TabBar(
                      labelPadding: EdgeInsets.only(left: 0, right: 0),
                      indicatorWeight: 4.0,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: primaryColor,
                      labelColor: primaryColor,
                      isScrollable: true,
                      unselectedLabelColor: textColorSecondary,
                      tabs: tabs,
                      onTap: (i) {
                        id = mCategory[i - 1].id;
                        fetchCategoriesWiseNewsData(mCategory[i - 1].id);
                      },
                    ),
                  ).visible(tabs.isNotEmpty)
                ],
              ),
            ),
          ),
          drawer: Drawer(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width,
                    height: context.height() * 0.15,
                    child: isLogin == true
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(backgroundImage: NetworkImage(mProfileImage.validate(), scale: width), radius: context.width() * 0.11),
                              4.width,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    userName.text(style: primaryTextStyle(color: textColorPrimary, size: textSizeMedium)),
                                    userEmail.text(style: primaryTextStyle(color: textColorPrimary, size: textSizeMedium), maxLines: 2)
                                  ],
                                ),
                              )
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Login.text(style: primaryTextStyle(color: textColorPrimary, size: textSizeLargeMedium))],
                          ),
                  ).onTap(() {
                    isLogin ? ProfileScreen(false).launch(context) : SignInScreen().launch(context,isNewTask: true);
                  }),
                  Divider(
                    color: lightGrey,
                  ),
                  8.height,
                  ListView.builder(
                    itemCount: arrSideMenu.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () async {
                          if (i == 0) {
                            BottomNavigationScreen().launch(context);
                          } else if (i == 1) {
                            LatestNewsListScreen(title: arrSideMenu[i], recentPost: recentNewsListing).launch(context);
                          } else if (i == 2) {
                            CategoryScreen(false).launch(context);
                          } else if (i == 3) {
                            await launch('mailto:User@gamil.com');
                          } else if (i == 4) {
                            SettingScreen().launch(context);
                          } else if (i == 5) {
                            OpenAppstore.launch(androidAppId: "com.iqonic.prokit");
                          } else if (i == 6) {
                            finish(context);
                            onShareTap();
                          } else if (i == 7) {
                            await clearSharedPref();
                            BottomNavigationScreen().launch(context, isNewTask: true);
                          }
                        },
                        child: Container(
                            padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(arrSideMenuIcon[i], height: 20, width: 20, color: darkBgColor),
                                    12.width,
                                    Text(arrSideMenu[i], style: secondaryTextStyle(color: textColorPrimary, size: textSizeMedium))
                                  ],
                                ),
                                Divider(color: Colors.grey.withOpacity(0)),
                              ],
                            )).paddingAll(4.0),
                      );
                    },
                  ),
                ],
              ).paddingOnly(left: 16, right: 16),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: () {
              return init();
            },
            child: Stack(
              children: [
                TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: tabs
                            .asMap()
                            .map((i, e) {
                              return MapEntry(i, newsList(i));
                            })
                            .values
                            .toList())
                    .visible(tabs.length > 0),
                CircularProgressIndicator().center().visible(isLoading),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Slider extends StatelessWidget {
  String file;

  Slider({Key key, @required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(left: 4, right: 4, top: 16),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0.0,
        margin: EdgeInsets.all(4.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Image.network(file, fit: BoxFit.cover),
      ),
    );
  }
}
