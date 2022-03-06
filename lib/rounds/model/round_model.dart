import "../../libs.dart";

class Round {
  int id;
  int categoryID;
  int trainingHours;
  int roundNumber;
  int students;
  double activeAmount;
  bool active;
  String startDate;
  String endDate;
  String lang;
  double fee;
  Date createdAt;

  Round({
    this.id = 0,
    required this.categoryID,
    required this.trainingHours,
    required this.roundNumber,
    required this.students,
    required this.activeAmount,
    required this.active,
    required this.startDate,
    required this.endDate,
    required this.lang,
    required this.fee,
    required this.createdAt,
  });

  factory Round.fromJson(Map<String, dynamic> json) {
    return Round(
        id: int.parse("${json["id"]}"),
        categoryID: int.parse("${json["category_id"]}"),
        trainingHours: int.parse("${json["training_hour"]}"),
        roundNumber: int.parse("${json["round_no"]}"),
        students: int.parse("${json["students"]}"),
        activeAmount: double.parse("${json["active_amount"]}"),
        active: json["active"] ?? false,
        startDate: "${json["start_date"]}",
        endDate: "${json["end_date"]}",
        lang: "${json["lang"]}",
        fee: double.parse("${json["fee"]}"),
        createdAt: Date.fromJson(json["created_at"] as Map<String, dynamic>));
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "category_id": this.categoryID,
      "training_hour": this.trainingHours,
      "round_no": this.roundNumber,
      "students": this.students,
      "active_amount": this.activeAmount,
      "active": this.active,
      "start_date": this.startDate,
      "lang": this.lang,
      "end_date": this.endDate,
      "fee": this.fee,
      "created_at": this.createdAt.toJson(),
    };
  }
  // fromJsonList ... 
  static List<Round> fromJsonList(List<Map<String, dynamic>> theJson) {
    return theJson.map((e) => Round.fromJson(e)).toList();
  }
}
