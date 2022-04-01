import "../../libs.dart";

class StudentPaymentsResponse {
  int statusCode;
  String msg;
  List<PayIn>? payments;
  List<Map<String, dynamic>> paymentsAsMap;
  int studentID;
  StudentPaymentsResponse(
      this.statusCode, this.msg, this.studentID, this.paymentsAsMap);

  void setPayments(List<PayIn> thePayments) {
    this.payments = thePayments;
  }
}

class StudentPaymentResponse {
  int statusCode;
  int studentID;
  PayIn? payment;
  String msg;

  StudentPaymentResponse(this.statusCode, this.studentID, this.msg,
      {this.payment});
}
