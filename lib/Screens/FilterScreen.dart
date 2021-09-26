import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_flutter/Model/model.dart';
import 'package:news_flutter/Utils/Colors.dart';
import 'package:news_flutter/Utils/DataGenrator.dart';
import 'package:news_flutter/Utils/Extensions.dart';
import 'package:news_flutter/Utils/Strings.dart';
import 'package:news_flutter/Utils/Widgets.dart';
import 'package:news_flutter/Utils/constant.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<CategoryModel> mCategory;
  int selectedCategory;

  @override
  void initState() {
    super.initState();
    mCategory = categoriesList();
  }

  @override
  Widget build(BuildContext context) {
    Widget filter() {
      return Container(
        width: context.width(),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: mCategory.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = index;
                });
              },
              child: Container(
                  alignment: Alignment.center,
                  width: context.width(),
                  height: context.height(),
                  decoration: boxDecoration(radius: 12.0, bgColor: selectedCategory != index ? white_color : primaryColor),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    mCategory[index].name,
                    style: primaryTextStyle(color: selectedCategory != index ? textColorPrimary : white_color, size: textSizeSMedium),
                  )),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 2.0),
        ).paddingOnly(left: 8.0, right: 8.0),
      );
    }

    changeStatusColor(white_color);

    return SafeArea(
      child: Scaffold(
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
              }),
          title: Text(
            Filter,
            style: boldTextStyle(color: textColorPrimary, size: 18),
          ),
        ),
        backgroundColor: app_Background,
        body: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                16.height,
                filter(),
              ],
            )
          ],
        ),
        bottomNavigationBar: Container(
          height: context.height() * 0.1,
          decoration: boxDecoration(bgColor: white_color),
          child: NewsButton(
            textContent: Apply,
            onPressed: () {},
          ).paddingAll(16.0),
        ),
      ),
    );
  }
}
