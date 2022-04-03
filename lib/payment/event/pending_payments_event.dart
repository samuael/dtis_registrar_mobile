import "../../libs.dart";

class PendingPaymentsEvent{}

class PendingPaymentsAddEvent extends PendingPaymentsEvent{
  PayInInput payment;
  PendingPaymentsAddEvent(this.payment);
}


class PendingPaymentsRemoveEvent extends PendingPaymentsEvent {
  int unix;
  String uchar;
  PendingPaymentsRemoveEvent(this.unix , this.uchar);
}
