class DashboardModel {
    String app_lang;
    List<Banner> banner;
    int feature_num_pages;
    List<FeaturePost> feature_post;
    int recent_num_pages;
    List<RecentPost> recent_post;
    SocialLink social_link;

    DashboardModel({this.app_lang, this.banner, this.feature_num_pages, this.feature_post, this.recent_num_pages, this.recent_post, this.social_link});

    factory DashboardModel.fromJson(Map<String, dynamic> json) {
        return DashboardModel(
            app_lang: json['app_lang'], 
            banner: json['banner'] != null ? (json['banner'] as List).map((i) => Banner.fromJson(i)).toList() : null, 
            feature_num_pages: json['feature_num_pages'], 
            feature_post: json['feature_post'] != null ? (json['feature_post'] as List).map((i) => FeaturePost.fromJson(i)).toList() : null, 
            recent_num_pages: json['recent_num_pages'], 
            recent_post: json['recent_post'] != null ? (json['recent_post'] as List).map((i) => RecentPost.fromJson(i)).toList() : null, 
            social_link: json['social_link'] != null ? SocialLink.fromJson(json['social_link']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['app_lang'] = this.app_lang;
        data['feature_num_pages'] = this.feature_num_pages;
        data['recent_num_pages'] = this.recent_num_pages;
        if (this.banner != null) {
            data['banner'] = this.banner.map((v) => v.toJson()).toList();
        }
        if (this.feature_post != null) {
            data['feature_post'] = this.feature_post.map((v) => v.toJson()).toList();
        }
        if (this.recent_post != null) {
            data['recent_post'] = this.recent_post.map((v) => v.toJson()).toList();
        }
        if (this.social_link != null) {
            data['social_link'] = this.social_link.toJson();
        }
        return data;
    }
}

class SocialLink {
    String contact;
    String copyright_text;
    String facebook;
    String instagram;
    String privacy_policy;
    String term_condition;
    String twitter;
    String whatsapp;

    SocialLink({this.contact, this.copyright_text, this.facebook, this.instagram, this.privacy_policy, this.term_condition, this.twitter, this.whatsapp});

    factory SocialLink.fromJson(Map<String, dynamic> json) {
        return SocialLink(
            contact: json['contact'], 
            copyright_text: json['copyright_text'], 
            facebook: json['facebook'], 
            instagram: json['instagram'], 
            privacy_policy: json['privacy_policy'], 
            term_condition: json['term_condition'], 
            twitter: json['twitter'], 
            whatsapp: json['whatsapp'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['contact'] = this.contact;
        data['copyright_text'] = this.copyright_text;
        data['facebook'] = this.facebook;
        data['instagram'] = this.instagram;
        data['privacy_policy'] = this.privacy_policy;
        data['term_condition'] = this.term_condition;
        data['twitter'] = this.twitter;
        data['whatsapp'] = this.whatsapp;
        return data;
    }
}

class FeaturePost {
    String human_time_diff;
    int iD;
    String image;
    String no_of_comments;
    String post_content;
    String post_date;
    String post_date_gmt;
    String post_excerpt;
    String post_title;
    String readable_date;

    FeaturePost({this.human_time_diff, this.iD, this.image, this.no_of_comments, this.post_content, this.post_date, this.post_date_gmt, this.post_excerpt, this.post_title, this.readable_date});

    factory FeaturePost.fromJson(Map<String, dynamic> json) {
        return FeaturePost(
            human_time_diff: json['human_time_diff'], 
            iD: json['iD'], 
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
        data['iD'] = this.iD;
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

class Banner {
    String desc;
    String image;
    String thumb;
    String url;

    Banner({this.desc, this.image, this.thumb, this.url});

    factory Banner.fromJson(Map<String, dynamic> json) {
        return Banner(
            desc: json['desc'], 
            image: json['image'], 
            thumb: json['thumb'], 
            url: json['url'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['desc'] = this.desc;
        data['image'] = this.image;
        data['thumb'] = this.thumb;
        data['url'] = this.url;
        return data;
    }
}

class RecentPost {
    String human_time_diff;
    int iD;
    String image;
    String no_of_comments;
    String post_content;
    String post_date;
    String post_date_gmt;
    String post_excerpt;
    String post_title;
    String readable_date;

    RecentPost({this.human_time_diff, this.iD, this.image, this.no_of_comments, this.post_content, this.post_date, this.post_date_gmt, this.post_excerpt, this.post_title, this.readable_date});

    factory RecentPost.fromJson(Map<String, dynamic> json) {
        return RecentPost(
            human_time_diff: json['human_time_diff'], 
            iD: json['iD'], 
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
        data['iD'] = this.iD;
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