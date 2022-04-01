import "../../libs.dart";

class StudentPaymentsState{}

class StudentPaymentsLoaded extends StudentPaymentsState {
  final Map<int , List<PayIn>>  paymentMap;

  StudentPaymentsLoaded(this.paymentMap);


  void add(int studentID , List<PayIn>  payments ) {
    this.paymentMap[studentID]= payments;
  }

}
class StudentPaymentsInit extends StudentPaymentsState {}
class StudentPaymentLoadFailed extends StudentPaymentsState{}