class SpecialCase {
  int? id;
  String? reason;
  double? coveredAmount;
  bool? completeFee;
  SpecialCase({this.id, this.reason, this.coveredAmount, this.completeFee});

  factory SpecialCase.fromJson(Map<String, dynamic> json) {
    return SpecialCase(
      id: int.parse("${json['id'] ?? 0}"),
      reason: "${json['reason']}",
      coveredAmount: double.parse("${json['covered_amount' ?? 0]}"),
      completeFee: json["complete_fee"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "reason": this.reason,
      "covered_amount": this.coveredAmount,
      "complete_fee": this.completeFee,
    };
  }
}
