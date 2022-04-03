import "../../libs.dart";

class StudentPaymentsEvent {}

class StudentPaymentsLoadEvent extends StudentPaymentsEvent{
  int studentID;
  StudentPaymentsLoadEvent(this.studentID);
}

class StudentPaymentsRemoveEvent extends StudentPaymentsEvent {
  int studentID;
  StudentPaymentsRemoveEvent(this.studentID);
}


class StudentPaymentAddEvent extends StudentPaymentsEvent {
  PayIn payment ;
  StudentPaymentAddEvent(this.payment);
}