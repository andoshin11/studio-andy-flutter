class Post {
  String slug;
  String title;
  String summary;
  String publishedAt;
  HeaderImage headerImage;
  HeaderImageLight headerImageLight;
  String content;
  List<String> tags;
  bool isPublished;

  Post(
      {this.slug,
      this.title,
      this.summary,
      this.publishedAt,
      this.headerImage,
      this.headerImageLight,
      this.content,
      this.tags,
      this.isPublished});

  Post.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    title = json['title'];
    summary = json['summary'];
    publishedAt = json['publishedAt'];
    headerImage = json['headerImage'] != null
        ? new HeaderImage.fromJson(json['headerImage'])
        : null;
    headerImageLight = json['headerImageLight'] != null
        ? new HeaderImageLight.fromJson(json['headerImageLight'])
        : null;
    content = json['content'];
    tags = json['tags'].cast<String>();
    isPublished = json['isPublished'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = this.slug;
    data['title'] = this.title;
    data['summary'] = this.summary;
    data['publishedAt'] = this.publishedAt;
    if (this.headerImage != null) {
      data['headerImage'] = this.headerImage.toJson();
    }
    if (this.headerImageLight != null) {
      data['headerImageLight'] = this.headerImageLight.toJson();
    }
    data['content'] = this.content;
    data['tags'] = this.tags;
    data['isPublished'] = this.isPublished;
    return data;
  }
}

class HeaderImage {
  Sys sys;

  HeaderImage({this.sys});

  HeaderImage.fromJson(Map<String, dynamic> json) {
    sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sys != null) {
      data['sys'] = this.sys.toJson();
    }
    return data;
  }
}

class Sys {
  String type;
  String linkType;
  String id;

  Sys({this.type, this.linkType, this.id});

  Sys.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    linkType = json['linkType'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['linkType'] = this.linkType;
    data['id'] = this.id;
    return data;
  }
}

class HeaderImageLight {
  Sys sys;

  HeaderImageLight({this.sys});

  HeaderImageLight.fromJson(Map<String, dynamic> json) {
    sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sys != null) {
      data['sys'] = this.sys.toJson();
    }
    return data;
  }
}
