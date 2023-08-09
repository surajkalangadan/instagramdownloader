class Instagrammodel {
  Instagrammodel({
      this.media, 
      this.thumbnail, 
      this.title, 
      this.type, 
      this.api,});

  Instagrammodel.fromJson(dynamic json) {
    media = json['media'];
    thumbnail = json['thumbnail'];
    title = json['title'];
    type = json['Type'];
    api = json['API'];
  }
  String? media;
  String? thumbnail;
  String? title;
  String? type;
  String? api;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['media'] = media;
    map['thumbnail'] = thumbnail;
    map['title'] = title;
    map['Type'] = type;
    map['API'] = api;
    return map;
  }

}