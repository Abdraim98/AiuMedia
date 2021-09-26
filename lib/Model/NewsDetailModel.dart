class PostDetailModel {
    int author;
    List<int> categories;
    String comment_status;
    Content content;
    String date;
    String date_gmt;
    Excerpt excerpt;
    int featured_media;
    String format;
    Guid guid;
    int id;
    String link;
    Links links;
    String modified;
    String modified_gmt;
    String ping_status;
    String slug;
    String status;
    bool sticky;
    String template;
    Title title;
    String type;

    PostDetailModel({this.author, this.categories, this.comment_status, this.content, this.date, this.date_gmt, this.excerpt, this.featured_media, this.format, this.guid, this.id, this.link, this.links, this.modified, this.modified_gmt, this.ping_status, this.slug, this.status, this.sticky, this.template, this.title, this.type});

    factory PostDetailModel.fromJson(Map<String, dynamic> json) {
        return PostDetailModel(
            author: json['author'], 
            categories: json['categories'] != null ? new List<int>.from(json['categories']) : null, 
            comment_status: json['comment_status'], 
            content: json['content'] != null ? Content.fromJson(json['content']) : null, 
            date: json['date'], 
            date_gmt: json['date_gmt'], 
            excerpt: json['excerpt'] != null ? Excerpt.fromJson(json['excerpt']) : null, 
            featured_media: json['featured_media'], 
            format: json['format'], 
            guid: json['guid'] != null ? Guid.fromJson(json['guid']) : null, 
            id: json['id'], 
            link: json['link'], 
            links: json['links'] != null ? Links.fromJson(json['links']) : null, 
            modified: json['modified'], 
            modified_gmt: json['modified_gmt'], 
            ping_status: json['ping_status'], 
            slug: json['slug'], 
            status: json['status'], 
            sticky: json['sticky'], 
            template: json['template'], 
            title: json['title'] != null ? Title.fromJson(json['title']) : null, 
            type: json['type'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['author'] = this.author;
        data['comment_status'] = this.comment_status;
        data['date'] = this.date;
        data['date_gmt'] = this.date_gmt;
        data['featured_media'] = this.featured_media;
        data['format'] = this.format;
        data['id'] = this.id;
        data['link'] = this.link;
        data['modified'] = this.modified;
        data['modified_gmt'] = this.modified_gmt;
        data['ping_status'] = this.ping_status;
        data['slug'] = this.slug;
        data['status'] = this.status;
        data['sticky'] = this.sticky;
        data['template'] = this.template;
        data['type'] = this.type;
        if (this.categories != null) {
            data['categories'] = this.categories;
        }
        if (this.content != null) {
            data['content'] = this.content.toJson();
        }
        if (this.excerpt != null) {
            data['excerpt'] = this.excerpt.toJson();
        }
        if (this.guid != null) {
            data['guid'] = this.guid.toJson();
        }
        if (this.links != null) {
            data['links'] = this.links.toJson();
        }
        if (this.title != null) {
            data['title'] = this.title.toJson();
        }
        return data;
    }
}

class Content {
    bool protected;
    String rendered;

    Content({this.protected, this.rendered});

    factory Content.fromJson(Map<String, dynamic> json) {
        return Content(
            protected: json['`protected`'],
            rendered: json['rendered'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['`protected`'] = this.protected;
        data['rendered'] = this.rendered;
        return data;
    }
}

class Title {
    String rendered;

    Title({this.rendered});

    factory Title.fromJson(Map<String, dynamic> json) {
        return Title(
            rendered: json['rendered'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['rendered'] = this.rendered;
        return data;
    }
}

class Excerpt {
    bool protected;
    String rendered;

    Excerpt({this.protected, this.rendered});

    factory Excerpt.fromJson(Map<String, dynamic> json) {
        return Excerpt(
            protected: json['`protected`'],
            rendered: json['rendered'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['`protected`'] = this.protected;
        data['rendered'] = this.rendered;
        return data;
    }
}

class Guid {
    String rendered;

    Guid({this.rendered});

    factory Guid.fromJson(Map<String, dynamic> json) {
        return Guid(
            rendered: json['rendered'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['rendered'] = this.rendered;
        return data;
    }
}

class Links {
    List<About> about;
    List<Attachment> attachment;
    List<Author> author;
    List<Collection> collection;
    List<Cury> curies;
    List<PredecessorVersion> predecessor_version;
    List<Reply> replies;
    List<Self> self;
    List<Term> term;
    List<VersionHistory> version_history;

    Links({this.about, this.attachment, this.author, this.collection, this.curies, this.predecessor_version, this.replies, this.self, this.term, this.version_history});

    factory Links.fromJson(Map<String, dynamic> json) {
        return Links(
            about: json['about'] != null ? (json['about'] as List).map((i) => About.fromJson(i)).toList() : null, 
            attachment: json['attachment'] != null ? (json['attachment'] as List).map((i) => Attachment.fromJson(i)).toList() : null, 
            author: json['author'] != null ? (json['author'] as List).map((i) => Author.fromJson(i)).toList() : null, 
            collection: json['collection'] != null ? (json['collection'] as List).map((i) => Collection.fromJson(i)).toList() : null, 
            curies: json['curies'] != null ? (json['curies'] as List).map((i) => Cury.fromJson(i)).toList() : null, 
            predecessor_version: json['predecessor_version'] != null ? (json['predecessor_version'] as List).map((i) => PredecessorVersion.fromJson(i)).toList() : null, 
            replies: json['replies'] != null ? (json['replies'] as List).map((i) => Reply.fromJson(i)).toList() : null, 
            self: json['self'] != null ? (json['self'] as List).map((i) => Self.fromJson(i)).toList() : null, 
            term: json['term'] != null ? (json['term'] as List).map((i) => Term.fromJson(i)).toList() : null, 
            version_history: json['version_history'] != null ? (json['version_history'] as List).map((i) => VersionHistory.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.about != null) {
            data['about'] = this.about.map((v) => v.toJson()).toList();
        }
        if (this.attachment != null) {
            data['attachment'] = this.attachment.map((v) => v.toJson()).toList();
        }
        if (this.author != null) {
            data['author'] = this.author.map((v) => v.toJson()).toList();
        }
        if (this.collection != null) {
            data['collection'] = this.collection.map((v) => v.toJson()).toList();
        }
        if (this.curies != null) {
            data['curies'] = this.curies.map((v) => v.toJson()).toList();
        }
        if (this.predecessor_version != null) {
            data['predecessor_version'] = this.predecessor_version.map((v) => v.toJson()).toList();
        }
        if (this.replies != null) {
            data['replies'] = this.replies.map((v) => v.toJson()).toList();
        }
        if (this.self != null) {
            data['self'] = this.self.map((v) => v.toJson()).toList();
        }
        if (this.term != null) {
            data['term'] = this.term.map((v) => v.toJson()).toList();
        }
        if (this.version_history != null) {
            data['version_history'] = this.version_history.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Term {
    bool embeddable;
    String href;
    String taxonomy;

    Term({this.embeddable, this.href, this.taxonomy});

    factory Term.fromJson(Map<String, dynamic> json) {
        return Term(
            embeddable: json['embeddable'], 
            href: json['href'], 
            taxonomy: json['taxonomy'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['embeddable'] = this.embeddable;
        data['href'] = this.href;
        data['taxonomy'] = this.taxonomy;
        return data;
    }
}

class VersionHistory {
    int count;
    String href;

    VersionHistory({this.count, this.href});

    factory VersionHistory.fromJson(Map<String, dynamic> json) {
        return VersionHistory(
            count: json['count'], 
            href: json['href'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['count'] = this.count;
        data['href'] = this.href;
        return data;
    }
}

class PredecessorVersion {
    String href;
    int id;

    PredecessorVersion({this.href, this.id});

    factory PredecessorVersion.fromJson(Map<String, dynamic> json) {
        return PredecessorVersion(
            href: json['href'], 
            id: json['id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['href'] = this.href;
        data['id'] = this.id;
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

class Attachment {
    String href;

    Attachment({this.href});

    factory Attachment.fromJson(Map<String, dynamic> json) {
        return Attachment(
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

class Reply {
    bool embeddable;
    String href;

    Reply({this.embeddable, this.href});

    factory Reply.fromJson(Map<String, dynamic> json) {
        return Reply(
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

class Author {
    bool embeddable;
    String href;

    Author({this.embeddable, this.href});

    factory Author.fromJson(Map<String, dynamic> json) {
        return Author(
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