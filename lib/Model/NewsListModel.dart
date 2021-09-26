class NewsListModel {
    Embedded embedded;
    int author;
    List<int> categories;
    String comment_status;
    Content content;
    String date;
    String date_gmt;
    Excerpt excerpt;
    int featured_media;
    String format;
    int id;
    String link;
    String modified;
    String modified_gmt;
    String ping_status;
    String slug;
    String status;
    bool sticky;
    String template;
    Title title;
    String type;

    NewsListModel({this.embedded, this.author, this.categories, this.comment_status, this.content, this.date, this.date_gmt, this.excerpt, this.featured_media, this.format, this.id, this.link, this.modified, this.modified_gmt, this.ping_status, this.slug, this.status, this.sticky, this.template, this.title, this.type});

    factory NewsListModel.fromJson(Map<String, dynamic> json) {
        return NewsListModel(
            embedded: json['_embedded'] != null ? Embedded.fromJson(json['_embedded']) : null,
            author: json['author'], 
            categories: json['categories'] != null ? new List<int>.from(json['categories']) : null, 
            comment_status: json['comment_status'], 
            content: json['content'] != null ? Content.fromJson(json['content']) : null, 
            date: json['date'], 
            date_gmt: json['date_gmt'], 
            excerpt: json['excerpt'] != null ? Excerpt.fromJson(json['excerpt']) : null, 
            featured_media: json['featured_media'], 
            format: json['format'], 
            id: json['id'], 
            link: json['link'], 
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
        if (this.embedded != null) {
            data['_embedded'] = this.embedded.toJson();
        }
        if (this.categories != null) {
            data['categories'] = this.categories;
        }
        if (this.content != null) {
            data['content'] = this.content.toJson();
        }
        if (this.excerpt != null) {
            data['excerpt'] = this.excerpt.toJson();
        }
        if (this.title != null) {
            data['title'] = this.title.toJson();
        }
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
            protected: json['protected'], 
            rendered: json['rendered'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['protected'] = this.protected;
        data['rendered'] = this.rendered;
        return data;
    }
}

class Embedded {
    List<Author> author;
    List<WpFeaturedmedia> wpFeaturedmedia;
    Embedded({this.author, this.wpFeaturedmedia});

    factory Embedded.fromJson(Map<String, dynamic> json) {
        return Embedded(
            author: json['author'] != null ? (json['author'] as List).map((i) => Author.fromJson(i)).toList() : null, 
            wpFeaturedmedia: json['wp:featuredmedia'] != null ? (json['wp:featuredmedia'] as List).map((i) => WpFeaturedmedia.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.author != null) {
            data['author'] = this.author.map((v) => v.toJson()).toList();
        }
        if (this.wpFeaturedmedia != null) {
            data['wp:featuredmedia'] = this.wpFeaturedmedia.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Author {
    Links links;
    String description;
    int id;
    String link;
    String name;
    String slug;
    String url;
    WoocommerceMeta woocommerce_meta;

    Author({this.links, this.description, this.id, this.link, this.name, this.slug, this.url, this.woocommerce_meta});

    factory Author.fromJson(Map<String, dynamic> json) {
        return Author(
            links: json['_links'] != null ? Links.fromJson(json['_links']) : null,
            description: json['description'],
            id: json['id'], 
            link: json['link'], 
            name: json['name'], 
            slug: json['slug'], 
            url: json['url'], 
            woocommerce_meta: json['woocommerce_meta'] != null ? WoocommerceMeta.fromJson(json['woocommerce_meta']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['description'] = this.description;
        data['id'] = this.id;
        data['link'] = this.link;
        data['name'] = this.name;
        data['slug'] = this.slug;
        data['url'] = this.url;
        if (this.links != null) {
            data['_links'] = this.links.toJson();
        }
        if (this.woocommerce_meta != null) {
            data['woocommerce_meta'] = this.woocommerce_meta.toJson();
        }
        return data;
    }
}

class Links {
    List<Collection> collection;
    List<Self> self;

    Links({this.collection, this.self});

    factory Links.fromJson(Map<String, dynamic> json) {
        return Links(
            collection: json['collection'] != null ? (json['collection'] as List).map((i) => Collection.fromJson(i)).toList() : null, 
            self: json['self'] != null ? (json['self'] as List).map((i) => Self.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
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

class WoocommerceMeta {
    String activity_panel_inbox_last_read;
    String activity_panel_reviews_last_read;
    String categories_report_columns;
    String coupons_report_columns;
    String customers_report_columns;
    String dashboard_chart_interval;
    String dashboard_chart_type;
    String dashboard_leaderboard_rows;
    String dashboard_sections;
    String homepage_stats;
    String orders_report_columns;
    String products_report_columns;
    String revenue_report_columns;
    String taxes_report_columns;
    String variations_report_columns;

    WoocommerceMeta({this.activity_panel_inbox_last_read, this.activity_panel_reviews_last_read, this.categories_report_columns, this.coupons_report_columns, this.customers_report_columns, this.dashboard_chart_interval, this.dashboard_chart_type, this.dashboard_leaderboard_rows, this.dashboard_sections, this.homepage_stats, this.orders_report_columns, this.products_report_columns, this.revenue_report_columns, this.taxes_report_columns, this.variations_report_columns});

    factory WoocommerceMeta.fromJson(Map<String, dynamic> json) {
        return WoocommerceMeta(
            activity_panel_inbox_last_read: json['activity_panel_inbox_last_read'], 
            activity_panel_reviews_last_read: json['activity_panel_reviews_last_read'], 
            categories_report_columns: json['categories_report_columns'], 
            coupons_report_columns: json['coupons_report_columns'], 
            customers_report_columns: json['customers_report_columns'], 
            dashboard_chart_interval: json['dashboard_chart_interval'], 
            dashboard_chart_type: json['dashboard_chart_type'], 
            dashboard_leaderboard_rows: json['dashboard_leaderboard_rows'], 
            dashboard_sections: json['dashboard_sections'], 
            homepage_stats: json['homepage_stats'], 
            orders_report_columns: json['orders_report_columns'], 
            products_report_columns: json['products_report_columns'], 
            revenue_report_columns: json['revenue_report_columns'], 
            taxes_report_columns: json['taxes_report_columns'], 
            variations_report_columns: json['variations_report_columns'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['activity_panel_inbox_last_read'] = this.activity_panel_inbox_last_read;
        data['activity_panel_reviews_last_read'] = this.activity_panel_reviews_last_read;
        data['categories_report_columns'] = this.categories_report_columns;
        data['coupons_report_columns'] = this.coupons_report_columns;
        data['customers_report_columns'] = this.customers_report_columns;
        data['dashboard_chart_interval'] = this.dashboard_chart_interval;
        data['dashboard_chart_type'] = this.dashboard_chart_type;
        data['dashboard_leaderboard_rows'] = this.dashboard_leaderboard_rows;
        data['dashboard_sections'] = this.dashboard_sections;
        data['homepage_stats'] = this.homepage_stats;
        data['orders_report_columns'] = this.orders_report_columns;
        data['products_report_columns'] = this.products_report_columns;
        data['revenue_report_columns'] = this.revenue_report_columns;
        data['taxes_report_columns'] = this.taxes_report_columns;
        data['variations_report_columns'] = this.variations_report_columns;
        return data;
    }
}

class WpTerm {
    LinksXX links;
    int id;
    String link;
    String name;
    String slug;
    String taxonomy;

    WpTerm({this.links, this.id, this.link, this.name, this.slug, this.taxonomy});

    factory WpTerm.fromJson(Map<String, dynamic> json) {
        return WpTerm(
            links: json['_links'] != null ? LinksXX.fromJson(json['_links']) : null,
            id: json['id'], 
            link: json['link'], 
            name: json['name'], 
            slug: json['slug'], 
            taxonomy: json['taxonomy'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['link'] = this.link;
        data['name'] = this.name;
        data['slug'] = this.slug;
        data['taxonomy'] = this.taxonomy;
        if (this.links != null) {
            data['_links'] = this.links.toJson();
        }
        return data;
    }
}

class LinksX {
    List<About> about;
    List<CollectionX> collection;
    List<Cury> curies;
    List<SelfX> self;
    List<WpPostType> post_type;

    LinksX({this.about, this.collection, this.curies, this.self, this.post_type});

    factory LinksX.fromJson(Map<String, dynamic> json) {
        return LinksX(
            about: json['about'] != null ? (json['about'] as List).map((i) => About.fromJson(i)).toList() : null, 
            collection: json['collection'] != null ? (json['collection'] as List).map((i) => CollectionX.fromJson(i)).toList() : null, 
            curies: json['curies'] != null ? (json['curies'] as List).map((i) => Cury.fromJson(i)).toList() : null, 
            self: json['self'] != null ? (json['self'] as List).map((i) => SelfX.fromJson(i)).toList() : null, 
            post_type: json['wp:post_type'] != null ? (json['wp:post_type'] as List).map((i) => WpPostType.fromJson(i)).toList() : null,
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
        if (this.post_type != null) {
            data['post_type'] = this.post_type.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class CollectionX {
    String href;

    CollectionX({this.href});

    factory CollectionX.fromJson(Map<String, dynamic> json) {
        return CollectionX(
            href: json['href'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['href'] = this.href;
        return data;
    }
}

class SelfX {
    String href;

    SelfX({this.href});

    factory SelfX.fromJson(Map<String, dynamic> json) {
        return SelfX(
            href: json['href'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['href'] = this.href;
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

class WpFeaturedmedia {
    LinksX links;
    String alt_text;
    int author;
    Caption caption;
    String date;
    int id;
    String link;
    MediaDetails media_details;
    String media_type;
    String mime_type;
    String slug;
    String source_url;
    TitleX title;
    String type;

    WpFeaturedmedia({this.links, this.alt_text, this.author, this.caption, this.date, this.id, this.link, this.media_details, this.media_type, this.mime_type, this.slug, this.source_url, this.title, this.type});

    factory WpFeaturedmedia.fromJson(Map<String, dynamic> json) {
        return WpFeaturedmedia(
            links: json['_links'] != null ? LinksX.fromJson(json['_links']) : null,
            alt_text: json['alt_text'], 
            author: json['author'], 
            caption: json['caption'] != null ? Caption.fromJson(json['caption']) : null, 
            date: json['date'], 
            id: json['id'], 
            link: json['link'], 
            media_details: json['media_details'] != null ? MediaDetails.fromJson(json['media_details']) : null, 
            media_type: json['media_type'], 
            mime_type: json['mime_type'], 
            slug: json['slug'], 
            source_url: json['source_url'], 
            title: json['title'] != null ? TitleX.fromJson(json['title']) : null, 
            type: json['type'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['alt_text'] = this.alt_text;
        data['author'] = this.author;
        data['date'] = this.date;
        data['id'] = this.id;
        data['link'] = this.link;
        data['media_type'] = this.media_type;
        data['mime_type'] = this.mime_type;
        data['slug'] = this.slug;
        data['source_url'] = this.source_url;
        data['type'] = this.type;
        if (this.links != null) {
            data['_links'] = this.links.toJson();
        }
        if (this.caption != null) {
            data['caption'] = this.caption.toJson();
        }
        if (this.media_details != null) {
            data['media_details'] = this.media_details.toJson();
        }
        if (this.title != null) {
            data['title'] = this.title.toJson();
        }
        return data;
    }
}

class LinksXX {
    List<AboutX> about;
    List<AuthorX> author;
    List<CollectionXX> collection;
    List<Reply> replies;
    List<SelfXX> self;

    LinksXX({this.about, this.author, this.collection, this.replies, this.self});

    factory LinksXX.fromJson(Map<String, dynamic> json) {
        return LinksXX(
            about: json['about'] != null ? (json['about'] as List).map((i) => AboutX.fromJson(i)).toList() : null, 
            author: json['author'] != null ? (json['author'] as List).map((i) => AuthorX.fromJson(i)).toList() : null, 
            collection: json['collection'] != null ? (json['collection'] as List).map((i) => CollectionXX.fromJson(i)).toList() : null, 
            replies: json['replies'] != null ? (json['replies'] as List).map((i) => Reply.fromJson(i)).toList() : null, 
            self: json['self'] != null ? (json['self'] as List).map((i) => SelfXX.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.about != null) {
            data['about'] = this.about.map((v) => v.toJson()).toList();
        }
        if (this.author != null) {
            data['author'] = this.author.map((v) => v.toJson()).toList();
        }
        if (this.collection != null) {
            data['collection'] = this.collection.map((v) => v.toJson()).toList();
        }
        if (this.replies != null) {
            data['replies'] = this.replies.map((v) => v.toJson()).toList();
        }
        if (this.self != null) {
            data['self'] = this.self.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class SelfXX {
    String href;

    SelfXX({this.href});

    factory SelfXX.fromJson(Map<String, dynamic> json) {
        return SelfXX(
            href: json['href'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['href'] = this.href;
        return data;
    }
}

class CollectionXX {
    String href;

    CollectionXX({this.href});

    factory CollectionXX.fromJson(Map<String, dynamic> json) {
        return CollectionXX(
            href: json['href'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['href'] = this.href;
        return data;
    }
}

class AboutX {
    String href;

    AboutX({this.href});

    factory AboutX.fromJson(Map<String, dynamic> json) {
        return AboutX(
            href: json['href'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['href'] = this.href;
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

class AuthorX {
    bool embeddable;
    String href;

    AuthorX({this.embeddable, this.href});

    factory AuthorX.fromJson(Map<String, dynamic> json) {
        return AuthorX(
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

class Caption {
    String rendered;

    Caption({this.rendered});

    factory Caption.fromJson(Map<String, dynamic> json) {
        return Caption(
            rendered: json['rendered'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['rendered'] = this.rendered;
        return data;
    }
}

class TitleX {
    String rendered;

    TitleX({this.rendered});

    factory TitleX.fromJson(Map<String, dynamic> json) {
        return TitleX(
            rendered: json['rendered'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['rendered'] = this.rendered;
        return data;
    }
}

class MediaDetails {
    String file;
    int height;
    ImageMeta image_meta;
    Sizes sizes;
    int width;

    MediaDetails({this.file, this.height, this.image_meta, this.sizes, this.width});

    factory MediaDetails.fromJson(Map<String, dynamic> json) {
        return MediaDetails(
            file: json['file'], 
            height: json['height'], 
            image_meta: json['image_meta'] != null ? ImageMeta.fromJson(json['image_meta']) : null, 
            sizes: json['sizes'] != null ? Sizes.fromJson(json['sizes']) : null, 
            width: json['width'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['file'] = this.file;
        data['height'] = this.height;
        data['width'] = this.width;
        if (this.image_meta != null) {
            data['image_meta'] = this.image_meta.toJson();
        }
        if (this.sizes != null) {
            data['sizes'] = this.sizes.toJson();
        }
        return data;
    }
}

class Sizes {
    EnvoStorefrontMed envoStorefrontMed;
    Full full;
    Medium medium;
    PostThumbnail postThumbnail;
    ShopCatalog shop_catalog;
    ShopSingle shop_single;
    ShopThumbnail shop_thumbnail;
    Thumbnail thumbnail;
    WoocommerceGalleryThumbnail woocommerce_gallery_thumbnail;
    WoocommerceSingle woocommerce_single;
    WoocommerceThumbnail woocommerce_thumbnail;

    Sizes({this.envoStorefrontMed, this.full, this.medium, this.postThumbnail, this.shop_catalog, this.shop_single, this.shop_thumbnail, this.thumbnail, this.woocommerce_gallery_thumbnail, this.woocommerce_single, this.woocommerce_thumbnail});

    factory Sizes.fromJson(Map<String, dynamic> json) {
        return Sizes(
            envoStorefrontMed: json['envo-storefront-med'] != null ? EnvoStorefrontMed.fromJson(json['envo-storefront-med']) : null,
            full: json['full'] != null ? Full.fromJson(json['full']) : null, 
            medium: json['medium'] != null ? Medium.fromJson(json['medium']) : null, 
            postThumbnail: json['post-thumbnail'] != null ? PostThumbnail.fromJson(json['post-thumbnail']) : null,
            shop_catalog: json['shop_catalog'] != null ? ShopCatalog.fromJson(json['shop_catalog']) : null, 
            shop_single: json['shop_single'] != null ? ShopSingle.fromJson(json['shop_single']) : null, 
            shop_thumbnail: json['shop_thumbnail'] != null ? ShopThumbnail.fromJson(json['shop_thumbnail']) : null, 
            thumbnail: json['thumbnail'] != null ? Thumbnail.fromJson(json['thumbnail']) : null, 
            woocommerce_gallery_thumbnail: json['woocommerce_gallery_thumbnail'] != null ? WoocommerceGalleryThumbnail.fromJson(json['woocommerce_gallery_thumbnail']) : null, 
            woocommerce_single: json['woocommerce_single'] != null ? WoocommerceSingle.fromJson(json['woocommerce_single']) : null, 
            woocommerce_thumbnail: json['woocommerce_thumbnail'] != null ? WoocommerceThumbnail.fromJson(json['woocommerce_thumbnail']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.envoStorefrontMed != null) {
            data['envo-storefront-med'] = this.envoStorefrontMed.toJson();
        }
        if (this.full != null) {
            data['full'] = this.full.toJson();
        }
        if (this.medium != null) {
            data['medium'] = this.medium.toJson();
        }
        if (this.postThumbnail != null) {
            data['post-thumbnail'] = this.postThumbnail.toJson();
        }
        if (this.shop_catalog != null) {
            data['shop_catalog'] = this.shop_catalog.toJson();
        }
        if (this.shop_single != null) {
            data['shop_single'] = this.shop_single.toJson();
        }
        if (this.shop_thumbnail != null) {
            data['shop_thumbnail'] = this.shop_thumbnail.toJson();
        }
        if (this.thumbnail != null) {
            data['thumbnail'] = this.thumbnail.toJson();
        }
        if (this.woocommerce_gallery_thumbnail != null) {
            data['woocommerce_gallery_thumbnail'] = this.woocommerce_gallery_thumbnail.toJson();
        }
        if (this.woocommerce_single != null) {
            data['woocommerce_single'] = this.woocommerce_single.toJson();
        }
        if (this.woocommerce_thumbnail != null) {
            data['woocommerce_thumbnail'] = this.woocommerce_thumbnail.toJson();
        }
        return data;
    }
}

class WoocommerceGalleryThumbnail {
    String file;
    int height;
    String mime_type;
    String source_url;
    int width;

    WoocommerceGalleryThumbnail({this.file, this.height, this.mime_type, this.source_url, this.width});

    factory WoocommerceGalleryThumbnail.fromJson(Map<String, dynamic> json) {
        return WoocommerceGalleryThumbnail(
            file: json['file'], 
            height: json['height'], 
            mime_type: json['mime_type'], 
            source_url: json['source_url'], 
            width: json['width'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['file'] = this.file;
        data['height'] = this.height;
        data['mime_type'] = this.mime_type;
        data['source_url'] = this.source_url;
        data['width'] = this.width;
        return data;
    }
}

class ShopSingle {
    String file;
    int height;
    String mime_type;
    String source_url;
    int width;

    ShopSingle({this.file, this.height, this.mime_type, this.source_url, this.width});

    factory ShopSingle.fromJson(Map<String, dynamic> json) {
        return ShopSingle(
            file: json['file'], 
            height: json['height'], 
            mime_type: json['mime_type'], 
            source_url: json['source_url'], 
            width: json['width'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['file'] = this.file;
        data['height'] = this.height;
        data['mime_type'] = this.mime_type;
        data['source_url'] = this.source_url;
        data['width'] = this.width;
        return data;
    }
}

class ShopThumbnail {
    String file;
    int height;
    String mime_type;
    String source_url;
    int width;

    ShopThumbnail({this.file, this.height, this.mime_type, this.source_url, this.width});

    factory ShopThumbnail.fromJson(Map<String, dynamic> json) {
        return ShopThumbnail(
            file: json['file'], 
            height: json['height'], 
            mime_type: json['mime_type'], 
            source_url: json['source_url'], 
            width: json['width'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['file'] = this.file;
        data['height'] = this.height;
        data['mime_type'] = this.mime_type;
        data['source_url'] = this.source_url;
        data['width'] = this.width;
        return data;
    }
}

class Medium {
    String file;
    int height;
    String mime_type;
    String source_url;
    int width;

    Medium({this.file, this.height, this.mime_type, this.source_url, this.width});

    factory Medium.fromJson(Map<String, dynamic> json) {
        return Medium(
            file: json['file'], 
            height: json['height'], 
            mime_type: json['mime_type'], 
            source_url: json['source_url'], 
            width: json['width'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['file'] = this.file;
        data['height'] = this.height;
        data['mime_type'] = this.mime_type;
        data['source_url'] = this.source_url;
        data['width'] = this.width;
        return data;
    }
}

class Full {
    String file;
    int height;
    String mime_type;
    String source_url;
    int width;

    Full({this.file, this.height, this.mime_type, this.source_url, this.width});

    factory Full.fromJson(Map<String, dynamic> json) {
        return Full(
            file: json['file'], 
            height: json['height'], 
            mime_type: json['mime_type'], 
            source_url: json['source_url'], 
            width: json['width'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['file'] = this.file;
        data['height'] = this.height;
        data['mime_type'] = this.mime_type;
        data['source_url'] = this.source_url;
        data['width'] = this.width;
        return data;
    }
}

class EnvoStorefrontMed {
    String file;
    int height;
    String mime_type;
    String source_url;
    int width;

    EnvoStorefrontMed({this.file, this.height, this.mime_type, this.source_url, this.width});

    factory EnvoStorefrontMed.fromJson(Map<String, dynamic> json) {
        return EnvoStorefrontMed(
            file: json['file'], 
            height: json['height'], 
            mime_type: json['mime_type'], 
            source_url: json['source_url'], 
            width: json['width'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['file'] = this.file;
        data['height'] = this.height;
        data['mime_type'] = this.mime_type;
        data['source_url'] = this.source_url;
        data['width'] = this.width;
        return data;
    }
}

class WoocommerceSingle {
    String file;
    int height;
    String mime_type;
    String source_url;
    int width;

    WoocommerceSingle({this.file, this.height, this.mime_type, this.source_url, this.width});

    factory WoocommerceSingle.fromJson(Map<String, dynamic> json) {
        return WoocommerceSingle(
            file: json['file'], 
            height: json['height'], 
            mime_type: json['mime_type'], 
            source_url: json['source_url'], 
            width: json['width'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['file'] = this.file;
        data['height'] = this.height;
        data['mime_type'] = this.mime_type;
        data['source_url'] = this.source_url;
        data['width'] = this.width;
        return data;
    }
}

class ShopCatalog {
    String file;
    int height;
    String mime_type;
    String source_url;
    int width;

    ShopCatalog({this.file, this.height, this.mime_type, this.source_url, this.width});

    factory ShopCatalog.fromJson(Map<String, dynamic> json) {
        return ShopCatalog(
            file: json['file'], 
            height: json['height'], 
            mime_type: json['mime_type'], 
            source_url: json['source_url'], 
            width: json['width'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['file'] = this.file;
        data['height'] = this.height;
        data['mime_type'] = this.mime_type;
        data['source_url'] = this.source_url;
        data['width'] = this.width;
        return data;
    }
}

class Thumbnail {
    String file;
    int height;
    String mime_type;
    String source_url;
    int width;

    Thumbnail({this.file, this.height, this.mime_type, this.source_url, this.width});

    factory Thumbnail.fromJson(Map<String, dynamic> json) {
        return Thumbnail(
            file: json['file'], 
            height: json['height'], 
            mime_type: json['mime_type'], 
            source_url: json['source_url'], 
            width: json['width'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['file'] = this.file;
        data['height'] = this.height;
        data['mime_type'] = this.mime_type;
        data['source_url'] = this.source_url;
        data['width'] = this.width;
        return data;
    }
}

class PostThumbnail {
    String file;
    int height;
    String mime_type;
    String source_url;
    int width;

    PostThumbnail({this.file, this.height, this.mime_type, this.source_url, this.width});

    factory PostThumbnail.fromJson(Map<String, dynamic> json) {
        return PostThumbnail(
            file: json['file'], 
            height: json['height'], 
            mime_type: json['mime_type'], 
            source_url: json['source_url'], 
            width: json['width'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['file'] = this.file;
        data['height'] = this.height;
        data['mime_type'] = this.mime_type;
        data['source_url'] = this.source_url;
        data['width'] = this.width;
        return data;
    }
}

class WoocommerceThumbnail {
    String file;
    int height;
    String mime_type;
    String source_url;
    bool uncropped;
    int width;

    WoocommerceThumbnail({this.file, this.height, this.mime_type, this.source_url, this.uncropped, this.width});

    factory WoocommerceThumbnail.fromJson(Map<String, dynamic> json) {
        return WoocommerceThumbnail(
            file: json['file'], 
            height: json['height'], 
            mime_type: json['mime_type'], 
            source_url: json['source_url'], 
            uncropped: json['uncropped'], 
            width: json['width'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['file'] = this.file;
        data['height'] = this.height;
        data['mime_type'] = this.mime_type;
        data['source_url'] = this.source_url;
        data['uncropped'] = this.uncropped;
        data['width'] = this.width;
        return data;
    }
}

class ImageMeta {
    String aperture;
    String camera;
    String caption;
    String copyright;
    String created_timestamp;
    String credit;
    String focal_length;
    String iso;
    String orientation;
    String shutter_speed;
    String title;

    ImageMeta({this.aperture, this.camera, this.caption, this.copyright, this.created_timestamp, this.credit, this.focal_length, this.iso, this.orientation, this.shutter_speed, this.title});

    factory ImageMeta.fromJson(Map<String, dynamic> json) {
        return ImageMeta(
            aperture: json['aperture'], 
            camera: json['camera'], 
            caption: json['caption'], 
            copyright: json['copyright'], 
            created_timestamp: json['created_timestamp'], 
            credit: json['credit'], 
            focal_length: json['focal_length'], 
            iso: json['iso'], 
            orientation: json['orientation'], 
            shutter_speed: json['shutter_speed'], 
            title: json['title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['aperture'] = this.aperture;
        data['camera'] = this.camera;
        data['caption'] = this.caption;
        data['copyright'] = this.copyright;
        data['created_timestamp'] = this.created_timestamp;
        data['credit'] = this.credit;
        data['focal_length'] = this.focal_length;
        data['iso'] = this.iso;
        data['orientation'] = this.orientation;
        data['shutter_speed'] = this.shutter_speed;
        data['title'] = this.title;
        return data;
    }
}

class Content {
    bool protected;
    String rendered;

    Content({this.protected, this.rendered});

    factory Content.fromJson(Map<String, dynamic> json) {
        return Content(
            protected: json['protected'], 
            rendered: json['rendered'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['protected'] = this.protected;
        data['rendered'] = this.rendered;
        return data;
    }
}