import "../../libs.dart";

class PendingPaymentsBloc
    extends Bloc<PendingPaymentsEvent, PendingPaymentsState> {
  PendingPaymentsBloc() : super(PendingPaymentsList([]));

  @override
  Stream<PendingPaymentsState> mapEventToState(
      PendingPaymentsEvent event) async* {
    if (event is PendingPaymentsAddEvent) {
      if (this.state is PendingPaymentsList) {
        final thestate = this.state;
        (thestate as PendingPaymentsList).payments.add((event).payment);
        yield PendingPaymentsInitState();
        yield thestate;
      } else {
        yield PendingPaymentsList([(event).payment]);
      }
    } else if (event is PendingPaymentsRemoveEvent) {
      final thestate = this.state;
      if (thestate is PendingPaymentsList) {
        thestate.payments.removeWhere((element) =>
            ((event.unix == element.unixSeconds) &&
                (event.uchar == element.uchars)));
        yield PendingPaymentsInitState();
        yield thestate;
      }
    }
  }

  
}
