class CategoriesModel {
    Links links;
    int count;
    String description;
    int id;
    String link;
    String name;
    int parent;
    String slug;
    String taxonomy;

    CategoriesModel({this.links, this.count, this.description, this.id, this.link, this.name, this.parent, this.slug, this.taxonomy});

    factory CategoriesModel.fromJson(Map<String, dynamic> json) {
        return CategoriesModel(
            links: json['_links'] != null ? Links.fromJson(json['_links']) : null,
            count: json['count'], 
            description: json['description'], 
            id: json['id'], 
            link: json['link'], 
            name: json['name'], 
            parent: json['parent'], 
            slug: json['slug'], 
            taxonomy: json['taxonomy'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['count'] = this.count;
        data['description'] = this.description;
        data['id'] = this.id;
        data['link'] = this.link;
        data['name'] = this.name;
        data['parent'] = this.parent;
        data['slug'] = this.slug;
        data['taxonomy'] = this.taxonomy;
        if (this.links != null) {
            data['_links'] = this.links.toJson();
        }
        return data;
    }
}

class Links {
    List<About> about;
    List<Collection> collection;
    List<Cury> curies;
    List<Self> self;
    List<WpPostType> postType;

    Links({this.about, this.collection, this.curies, this.self, this.postType});

    factory Links.fromJson(Map<String, dynamic> json) {
        return Links(
            about: json['about'] != null ? (json['about'] as List).map((i) => About.fromJson(i)).toList() : null, 
            collection: json['collection'] != null ? (json['collection'] as List).map((i) => Collection.fromJson(i)).toList() : null, 
            curies: json['curies'] != null ? (json['curies'] as List).map((i) => Cury.fromJson(i)).toList() : null, 
            self: json['self'] != null ? (json['self'] as List).map((i) => Self.fromJson(i)).toList() : null,
            postType: json['wp:post_type'] != null ? (json['wp:post_type'] as List).map((i) => WpPostType.fromJson(i)).toList() : null, 
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
        if (this.curies != null) {
            data['curies'] = this.curies.map((v) => v.toJson()).toList();
        }
        if (this.self != null) {
            data['self'] = this.self.map((v) => v.toJson()).toList();
        }
        if (this.postType != null) {
            data['wp:post_type'] = this.postType.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class WpPostType {
    String href;

    WpPostType({this.href});

    factory WpPostType.fromJson(Map<String, dynamic> json) {
        return WpPostType(
            href: json['href'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['href'] = this.href;
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

class Self {
    String href;

    Self({this.href});

    factory Self.fromJson(Map<String, dynamic> json) {
        return Self(
            href: json['href'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['href'] = this.href;
        return data;
    }
}

class Cury {
    String href;
    String name;
    bool templated;

    Cury({this.href, this.name, this.templated});

    factory Cury.fromJson(Map<String, dynamic> json) {
        return Cury(
            href: json['href'], 
            name: json['name'], 
            templated: json['templated'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['href'] = this.href;
        data['name'] = this.name;
        data['templated'] = this.templated;
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