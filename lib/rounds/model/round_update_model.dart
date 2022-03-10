class RoundUpdateModel {
  int id;
  int trainingHours;
  int roundNumber;
  String startDate;
  String endDate;
  String lang;
  double fee;

  RoundUpdateModel({
    this.id = 0,
    required this.trainingHours,
    required this.roundNumber,
    required this.startDate,
    required this.endDate,
    required this.lang,
    required this.fee,
  });

  factory RoundUpdateModel.fromJson(Map<String, dynamic> json) {
    return RoundUpdateModel(
        id: int.parse("${json["id"]}"),
        trainingHours: int.parse("${json["training_hour"]}"),
        roundNumber: int.parse("${json["round_no"]}"),
        startDate: "${json["start_date"]}",
        endDate: "${json["end_date"]}",
        lang: "${json["lang"]}",
        fee: double.parse("${json["fee"]}"));
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "training_hour": this.trainingHours,
      "round_no": this.roundNumber,
      "start_date": this.startDate,
      "lang": this.lang,
      "end_date": this.endDate,
      "fee": this.fee,
    };
  }

  // fromJsonList ...
  static List<RoundUpdateModel> fromJsonList(
      List<Map<String, dynamic>> theJson) {
    return theJson.map((e) => RoundUpdateModel.fromJson(e)).toList();
  }
}
