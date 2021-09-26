class SearchModel {
    Links links;
    int id;
    String subtype;
    String title;
    String type;
    String url;

    SearchModel({this.links, this.id, this.subtype, this.title, this.type, this.url});

    factory SearchModel.fromJson(Map<String, dynamic> json) {
        return SearchModel(
            links: json['_links'] != null ? Links.fromJson(json['_links']) : null,
            id: json['id'], 
            subtype: json['subtype'], 
            title: json['title'], 
            type: json['type'], 
            url: json['url'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['subtype'] = this.subtype;
        data['title'] = this.title;
        data['type'] = this.type;
        data['url'] = this.url;
        if (this.links != null) {
            data['_links'] = this.links.toJson();
        }
        return data;
    }
}

class Links {
    List<About> about;
    List<Collection> collection;
    List<Self> self;

    Links({this.about, this.collection, this.self});

    factory Links.fromJson(Map<String, dynamic> json) {
        return Links(
            about: json['about'] != null ? (json['about'] as List).map((i) => About.fromJson(i)).toList() : null, 
            collection: json['collection'] != null ? (json['collection'] as List).map((i) => Collection.fromJson(i)).toList() : null, 
            self: json['self'] != null ? (json['self'] as List).map((i) => Self.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.about != null) {
            data['about'] = this.about.map((v) => v.toJson()).toList();
        }
        if (this.collection != null) {
            data['collection'] = this.collection.map((v) => v.toJson()).toList();
        }
        if (this.self != null) {
            data['self'] = this.self.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Collection {
    String href;

    Collection({this.href});

    factory Collection.fromJson(Map<String, dynamic> json) {
        return Collection(
            href: json['href'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['href'] = this.href;
        return data;
    }
}

class About {
    String href;

    About({this.href});

    factory About.fromJson(Map<String, dynamic> json) {
        return About(
            href: json['href'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['href'] = this.href;
        return data;
    }
}

class Self {
    bool embeddable;
    String href;

    Self({this.embeddable, this.href});

    factory Self.fromJson(Map<String, dynamic> json) {
        return Self(
            embeddable: json['embeddable'], 
            href: json['href'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['embeddable'] = this.embeddable;
        data['href'] = this.href;
        return data;
    }
}