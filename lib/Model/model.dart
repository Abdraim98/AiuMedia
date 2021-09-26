
class CategoryModel {
  String name = '';

  CategoryModel({this.name});
}

class FeaturedNewsModel {
  String type = '';
  String title = '';
  String time = '';
  String img = '';

  FeaturedNewsModel({this.type, this.title, this.time,this.img});
}

class CommentModel {
  String img = '';
  String name = '';
  String comment = '';
  String totalLike = '';
  String totalDisLike = '';
  String time = '';

  CommentModel({this.img, this.name, this.comment,this.totalLike,this.totalDisLike,this.time});
}