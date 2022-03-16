class SpecialCase {
  int id;
  String reason;
  double coveredAmount;
  bool completeFee;
  SpecialCase(this.id, this.reason, this.coveredAmount, this.completeFee);

  factory SpecialCase.fromJson(Map<String, dynamic> json) {
    return SpecialCase(
      int.parse("${json['id'] ?? 0}"),
      "${json['reason']}",
      double.parse("${json['covered_amount' ?? 0]}"),
      json["complete_fee"] ?? false,
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