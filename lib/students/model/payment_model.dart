import "../../libs.dart";

class PayIn {
  PayIn(this.id, this.amount, this.recievedBy, this.studentID, this.createdAt,
      this.roundID, this.status, this.uniqueChars);

  int? id;
  double amount;
  int recievedBy;
  int studentID;
  Date createdAt;
  int roundID;
  int status;

  // String statusDescription;
  String uniqueChars;

  factory PayIn.fromJson(Map<String, dynamic> theMap) {
    return PayIn(
      int.parse("${theMap["id"] ?? 0}"),
      double.parse("${theMap["amount"] ?? 0}"),
      int.parse("${theMap["recieved_by"]}"),
      int.parse("${theMap["student_id"]}"),
      Date.fromJson(theMap["created_at"]),
      int.parse("${theMap['round_id']}"),
      int.parse("${theMap['status']}"),
      "${theMap['uchars'] ?? ''}",
      // ------------------------
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "amount": this.amount,
      "recieved_by": this.recievedBy,
      "student_id": this.studentID,
      "created_at": this.createdAt.toJson(),
      "round_id": this.roundID,
      "status": this.status,
      "uchars": this.uniqueChars,
    };
  }
}






class PayInInput {
  PayInInput(this.amount , this.studentID , this.unixSeconds , this.roundID , this.uchars);

  double amount;
  int studentID;
  int unixSeconds;
  int roundID;
  String uchars;


  Map<String, dynamic> toJson() {
    return {
      "amount": this.amount,
      "student_id": this.studentID,
      "unix_timestamp": this.unixSeconds,
      "round_id": this.roundID,
      "uchars": this.uchars,
    };
  }
}
