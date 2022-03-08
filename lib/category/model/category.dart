import '../../libs.dart';

class Category {
  int id;
  String title;
  String shortTitle;
  int numberOfRounds;
  String imgurl;
  double fee;
  Date? createdAt;
  int? studentsQuantity;
  int? activeStudentsQuantity;
  List<Round>? rounds;

  Category({
    this.id = 0,
    required this.title,
    required this.shortTitle,
    required this.numberOfRounds,
    this.fee = 0.0,
    this.imgurl = "",
    required this.createdAt,
    this.studentsQuantity = -1,
    this.activeStudentsQuantity = -1,
    this.rounds,
  });

  // setStudentsQuantity .. number of students.
  void setStudentsQuantity(int all, int active) {
    this.studentsQuantity = all;
    this.activeStudentsQuantity = active;
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"] as int,
      title: json["title"],
      shortTitle: json["short_title"],
      numberOfRounds: json["rounds_count"],
      imgurl: json["imgurl"],
      fee: double.parse("${json['fee']}"),
      createdAt: Date.fromJson(json["created_at"]),
      // rounds:
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "title": this.title,
      "short_title": this.shortTitle,
      "rounds_count": this.rounds,
      "imgurl": this.imgurl,
      "fee": this.fee,
      "created_at": this.createdAt!.toJson(),
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "id": this.id,
      "title": this.title,
      "short_title": this.shortTitle,
      "fee": this.fee,
    };
  }
}
