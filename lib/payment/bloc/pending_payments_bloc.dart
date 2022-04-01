import "../../libs.dart";

class PendingPaymentsBloc extends Bloc<PendingPaymentsEvent , PendingPaymentsState> {
  PendingPaymentsBloc() : super(PendingPaymentsInitState());

}