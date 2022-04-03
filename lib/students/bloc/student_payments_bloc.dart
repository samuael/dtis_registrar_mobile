import "../../libs.dart";

class StudentPaymentsBloc
    extends Bloc<StudentPaymentsEvent, StudentPaymentsState> {
  StudentPaymentsBloc() : super(StudentPaymentsInit());
  StudentPaymentsRepo repo = StudentPaymentsRepo();

  @override
  Stream<StudentPaymentsState> mapEventToState(
      StudentPaymentsEvent event) async* {
    if (event is StudentPaymentsLoadEvent) {
      print("This function is called ... ");
      final result = await this.repo.getPaymentsOfStudent(event.studentID);
      if (result.statusCode == 200 || result.statusCode == 404) {
        if (this.state is StudentPaymentsLoaded) {
          final thestate = this.state;
          yield StudentPaymentsInit();
          if ((thestate as StudentPaymentsLoaded)
                  .paymentMap[result.studentID] ==
              null) {
            (thestate).paymentMap[result.studentID] = result.payments!;
          } else {
            (thestate).paymentMap[result.studentID]!.addAll(result.payments!);
          }
        } else {
          yield StudentPaymentsLoaded({result.studentID: result.payments!});
        }
      } else {
        if (!(this.state is StudentPaymentsLoaded)) {
          yield StudentPaymentLoadFailed();
        }
      }
    } else if (event is StudentPaymentAddEvent) {
        if (this.state is StudentPaymentsLoaded) {
          final thestate = this.state;
          yield StudentPaymentsInit();
          if ((thestate as StudentPaymentsLoaded)
                  .paymentMap[event.payment.studentID] ==
              null) {
            (thestate).paymentMap[event.payment.studentID] = [
              event.payment
            ];
          } else {
            thestate.paymentMap[event.payment.studentID]!
                .add(event.payment);
          }
          yield thestate;
        } else {
          yield StudentPaymentsLoaded({
            event.payment.studentID: [event.payment]
          });
        }
    }
  }

  Future<StudentPaymentResponse> makePayment(PayInInput payment) async {
    return await this.repo.makePayment(payment);
  }
}
