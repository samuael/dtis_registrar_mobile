class Category {
  int id;
  String title;
  String shortTitle;
  int rounds;
  String imgurl;

  Category(
    this.id,
    this.title,
    this.shortTitle,
    this.rounds,
    this.imgurl,
  );

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      int.parse(json["id"]),
      json["title"],
      json["short_title"],
      json["rounds_count"],
      json["imgurl"],
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
