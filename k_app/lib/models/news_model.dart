class NewsModel {
  final int id;
  final String title;
  final String desc;
  final String author;

  NewsModel(
      {required this.id,
      required this.title,
      required this.desc,
      required this.author});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        id: json['id'],
        title: json['title'],
        desc: json['desc'],
        author: json['author']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'desc': desc,
      'author': author,
    };
  }
}
