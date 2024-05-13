class ReportsModel {
  final int id;
  final String title;
  final String desc;
  final String location;
  final String category;

  ReportsModel(
      {required this.id,
      required this.title,
      required this.desc,
      required this.location,
      required this.category});

  factory ReportsModel.fromJson(Map<String, dynamic> json) {
    return ReportsModel(
        id: json['id'],
        title: json['title'],
        desc: json['desc'],
        location: json['location'],
        category: json['category']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'desc': desc,
      'location': location,
      'category': category
    };
  }
}
