import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'constant.dart';
import 'package:intl/intl.dart';
import 'package:html/parser.dart' show parse;

String convertDate(date) {
  try {
    return date != null ? DateFormat(dateFormat).format(DateTime.parse(date)) : '';
  } catch (e) {
    print(e);
    return '';
  }
}

String parseHtmlString(String htmlString) {
  return parse(parse(htmlString).body.text).documentElement.text;
}

void loader(bool isLoader) {
    Column(
      children: [
        CircularProgressIndicator(),
        'Loading...'.text(style: primaryTextStyle(color: textPrimaryColor,size: textSizeSMedium)),
      ],
    ).visible(isLoader == true);
}