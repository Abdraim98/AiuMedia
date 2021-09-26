class SaveProfileModel {
    int code;
    String message;
    String profile_image;

    SaveProfileModel({this.code, this.message, this.profile_image});

    factory SaveProfileModel.fromJson(Map<String, dynamic> json) {
        return SaveProfileModel(
            code: json['code'], 
            message: json['message'], 
            profile_image: json['profile_image'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['code'] = this.code;
        data['message'] = this.message;
        data['profile_image'] = this.profile_image;
        return data;
    }
}