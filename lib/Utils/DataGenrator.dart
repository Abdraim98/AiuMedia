import 'package:news_flutter/Model/model.dart';
import 'package:news_flutter/Utils/Images.dart';

List<CategoryModel> categoriesList() {
  List<CategoryModel> list = List();

  var list1 = CategoryModel(name: 'Business');
  list.add(list1);

  var list2 = CategoryModel(name: 'City');
  list.add(list2);

  var list3 = CategoryModel(name: 'Education');
  list.add(list3);

  var list4 = CategoryModel(name: 'Entertainment');
  list.add(list4);

  var list5 = CategoryModel(name: 'Feature');
  list.add(list5);

  var list6 = CategoryModel(name: 'Foods');
  list.add(list6);

  var list7 = CategoryModel(name: 'Life & Cycles');
  list.add(list7);

  var list8 = CategoryModel(name: 'Sports');
  list.add(list8);

  var list9 = CategoryModel(name: 'Technology');
  list.add(list9);

  return list;
}

List<CategoryModel> drawerList() {
  List<CategoryModel> list = List();

  var list1 = CategoryModel(name: 'HOME');
  list.add(list1);

  var list2 = CategoryModel(name: 'LATEST');
  list.add(list2);

  var list3 = CategoryModel(name: 'CATEGORIES');
  list.add(list3);

  var list4 = CategoryModel(name: 'CONTACT US');
  list.add(list4);

  var list5 = CategoryModel(name: 'SETTINGS');
  list.add(list5);

  var list6 = CategoryModel(name: 'SHARE');
  list.add(list6);

  return list;
}