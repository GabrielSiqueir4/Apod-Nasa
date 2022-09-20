class NasaPost {
  late String date;
  late String explanation;
  late String title;
  late String url;

  NasaPost({
    required this.date,
    required this.explanation,
    required this.title,
    required this.url,
  });

  NasaPost.fromJson(Map<String, dynamic> json) {
    this.date = json['date'];
    this.explanation = json['explanation'];
    this.title = json['title'];
    this.url = json['url'];
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'explanation': explanation,
      'title': title,
      'url': url,
    };
  }
}
