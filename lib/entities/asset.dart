class Asset {
  String id;
  String url;
  String title;
  String contentType;

  Asset({this.id, this.url, this.title, this.contentType});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['sys']['id'];
    url = json['fields']['file']['url'];
    title = json['fields']['title'];
    contentType = json['fields']['file']['contentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['title'] = this.title;
    data['contentType'] = this.contentType;
    return data;
  }
}
