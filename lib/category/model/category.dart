class Category {
  int id;
  String title;
  String shortTitle;
  int rounds;
  String imgurl;

  Category({
    this.id = 0,
    required this.title,
    required this.shortTitle,
    required this.rounds,
    this.imgurl = "",
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"] as int,
      title: json["title"],
      shortTitle: json["short_title"],
      rounds: json["rounds_count"],
      imgurl: json["imgurl"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "title": this.title,
      "short_title": this.shortTitle,
      "rounds_count": this.rounds,
      "imgurl": this.imgurl,
    };
  }
}
