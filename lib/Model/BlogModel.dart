class BlogModel {
  int num_pages;
  List<Post> posts;

  BlogModel({this.num_pages, this.posts});

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      num_pages: json['num_pages'],
      posts: json['posts'] != null ? (json['posts'] as List).map((i) => Post.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num_pages'] = this.num_pages;
    if (this.posts != null) {
      data['posts'] = this.posts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Post {
  String human_time_diff;
  int ID;
  String image;
  String no_of_comments;
  String post_content;
  String post_date;
  String post_date_gmt;
  String post_excerpt;
  String post_title;
  String readable_date;

  Post(
      {this.human_time_diff,
      this.ID,
      this.image,
      this.no_of_comments,
      this.post_content,
      this.post_date,
      this.post_date_gmt,
      this.post_excerpt,
      this.post_title,
      this.readable_date});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      human_time_diff: json['human_time_diff'],
      ID: json['ID'],
      image: json['image'],
      no_of_comments: json['no_of_comments'],
      post_content: json['post_content'],
      post_date: json['post_date'],
      post_date_gmt: json['post_date_gmt'],
      post_excerpt: json['post_excerpt'],
      post_title: json['post_title'],
      readable_date: json['readable_date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['human_time_diff'] = this.human_time_diff;
    data['ID'] = this.ID;
    data['image'] = this.image;
    data['no_of_comments'] = this.no_of_comments;
    data['post_content'] = this.post_content;
    data['post_date'] = this.post_date;
    data['post_date_gmt'] = this.post_date_gmt;
    data['post_excerpt'] = this.post_excerpt;
    data['post_title'] = this.post_title;
    data['readable_date'] = this.readable_date;
    return data;
  }
}
