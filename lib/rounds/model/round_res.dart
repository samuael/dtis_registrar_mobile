class RoundInput {
  int categoryID;
  int trainingHours;
  int roundNumber;
  bool active;
  String startDate;
  String endDate;
  String lang;
  double fee;

  RoundInput({
    required this.categoryID,
    required this.trainingHours,
    required this.roundNumber,
    required this.active,
    required this.startDate,
    required this.endDate,
    required this.lang,
    required this.fee,
  });

  factory RoundInput.fromJson(Map<String, dynamic> json) {
    return RoundInput(
        categoryID: int.parse("${json["category_id"]}"),
        trainingHours: int.parse("${json["training_hour"]}"),
        roundNumber: int.parse("${json["round_no"]}"),
        active: json["active"] ?? false,
        startDate: "${json["start_date"]}",
        endDate: "${json["end_date"]}",
        lang: "${json["lang"]}",
        fee: double.parse("${json["fee"]}"),
        );
  }

  Map<String, dynamic> toJson() {
    return {
      "category_id": this.categoryID,
      "training_hour": this.trainingHours,
      "round_no": this.roundNumber,
      "active": this.active,
      "start_date": this.startDate,
      "lang": this.lang,
      "end_date": this.endDate,
      "fee": this.fee,
    };
  }
  // fromJsonList ... 
  static List<RoundInput> fromJsonList(List<Map<String, dynamic>> theJson) {
    return theJson.map((e) => RoundInput.fromJson(e)).toList();
  }
}
