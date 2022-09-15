class Nasa {
  late String apod_site;
  late String copytight;
  late String data;
  late String descricao;
  late String hdurl;
  late String image_thumbnail;
  late String media_type;
  late String title;
  late String url;

  Nasa({
    required this.apod_site,
    required this.copytight,
    required this.data,
    required this.descricao,
    required this.hdurl,
    required this.image_thumbnail,
    required this.media_type,
    required this.title,
    required this.url,
  });

  factory Nasa.fromJson(Map<String, dynamic> json) {
    return Nasa(
      apod_site: json['apod_site'],
      copytight: json['copytight'],
      data: json['date'],
      descricao: json['description'],
      hdurl: json['hdurl'],
      image_thumbnail: json['image_thumbnail'],
      media_type: json['media_type'],
      title: json['title'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apod_site'] = this.apod_site;
    data['copytight'] = this.copytight;
    data['date'] = this.data;
    data['description'] = this.descricao;
    data['hdulr'] = this.hdurl;
    data['image_thumbnail'] = this.image_thumbnail;
    data['media_type'] = this.media_type;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}
