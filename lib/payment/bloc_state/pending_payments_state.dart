import "../../libs.dart";

class PendingPaymentsState {}

class PendingPaymentsInitState extends PendingPaymentsState {}

class PendingPaymentsList extends PendingPaymentsState {
  List<PayInInput> payments;
  PendingPaymentsList(this.payments);
}
