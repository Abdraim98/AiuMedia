class SliderModel {
  String image;
  String thumb;
  String url;

  SliderModel({this.image, this.thumb, this.url});

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      image: json['image'],
      thumb: json['thumb'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['thumb'] = this.thumb;
    data['url'] = this.url;
    return data;
  }
}