import "../../libs.dart";

class StudentsPendingPayments extends StatefulWidget {
  final Student student;
  StudentsPendingPayments(this.student);

  @override
  State<StudentsPendingPayments> createState() {
    return StudentPendingPaymentsState();
  }
}

class StudentPendingPaymentsState extends State<StudentsPendingPayments> {
 
  @override
  Widget build(BuildContext context) {
    final netRemaining =
        (context.watch<CategoriesBloc>().state as CategoriesListSuccess)
                .getRoundByID(widget.student.roundID)!
                .fee -
            widget.student.paidAmount;

    return Column(
      children: [
        BlocBuilder<PendingPaymentsBloc, PendingPaymentsState>(
            builder: (context, state) {
          if (state is PendingPaymentsList) {
            // if (state.paymentMap[widget.studentID] != null) {
            final studentsPendingPayments = state.payments.where((element) => (element.studentID== widget.student.id));
            if ((studentsPendingPayments ?? []).length == 0) {
              return Container(
                margin: EdgeInsets.only(
                  top: 100,
                ),
                child: Center(
                  child: Text(
                    "There is no Pending Payment Transaction related to this student!",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              );
            } else {
              return Container(
                child: Stack(
                  children: [
                    Column(
                      children: (studentsPendingPayments??[])
                          .map<PendingPaymentItem>((e) {
                        return PendingPaymentItem(e);
                      }).toList(),
                    ),
                  ],
                ),
              );
            }
            // }
          } else {
            return Container(
              margin: EdgeInsets.only(
                top: 100,
              ),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }),
      ],
    );
  }
}
