import "../../libs.dart";

class PendingPaymentItem extends StatefulWidget {
  final PayInInput payment;
  PendingPaymentItem(this.payment);

  @override
  State<PendingPaymentItem> createState() {
    return PendingPaymentItemState();
  }
}

class PendingPaymentItemState extends State<PendingPaymentItem> {
  bool hovering = false;
  bool loading = false;
  TextEditingController paymentAmountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final studentPaymentBloc = BlocProvider.of<StudentPaymentsBloc>(context);
    final roundStudentBloc = BlocProvider.of<RoundStudentsBloc>(context);
    final student = (roundStudentBloc.state as RoundStudentsLoaded)
        .getStudent(widget.payment.roundID, widget.payment.studentID);
    final pendingPaymensBloc = BlocProvider.of<PendingPaymentsBloc>(context);
    final netRemaining =
        (context.watch<CategoriesBloc>().state as CategoriesListSuccess)
                .getRoundByID(student.roundID)!
                .fee -
            student.paidAmount;

    return MouseRegion(
      onEnter: (prt) {
        setState(() {
          this.hovering = true;
        });
      },
      onExit: (prt) {
        setState(
          () {
            this.hovering = false;
          },
        );
      },
      child: Container(
        color: hovering ? Colors.white : Colors.white38,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StudentSmallView(student),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          "Paid Amount : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${widget.payment.amount}",
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          "Date: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${getDuration(widget.payment.unixSeconds)}",
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          "Recieved By : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          (context.watch<AdminsListBloc>().state
                                  is AdminsListLoadSuccess)
                              ? "${(context.read<AuthBloc>().state as AuthAdminLoggedIn).admin.fullname}"
                              : "Unknown",
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment : MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (netRemaining > 0 && !loading) {
                            try {
                              setState(() {
                                loading = true;
                              });
                              final paymentResult = studentPaymentBloc
                                  .makePayment(widget.payment);
                              // -----------------------------------------
                              paymentResult.then((paymentResult) {
                                print(paymentResult.statusCode);
                                if (paymentResult.statusCode == 201) {
                                  studentPaymentBloc.add(
                                    StudentPaymentAddEvent(
                                        paymentResult.payment!),
                                  );
                                  student.paidAmount += widget.payment.amount;
                                  pendingPaymensBloc.add(
                                    PendingPaymentsRemoveEvent(
                                        widget.payment.unixSeconds,
                                        widget.payment.uchars),
                                  );
                                } else if ((paymentResult.statusCode == 409)) {
                                  pendingPaymensBloc.add(
                                    PendingPaymentsRemoveEvent(
                                        widget.payment.unixSeconds,
                                        widget.payment.uchars),
                                  );
                                } else {
                                  setState(() {
                                    this.loading = false;
                                  });
                                }
                              });
                            } catch (e) {
                              // paymentMessage = "invalid payment value";
                              // paymentMessageColor = Colors.red;
                              setState(() {
                                loading = false;
                              });
                            }
                          }
                        },
                        child: Container(
                          child: Row(
                            children: [
                              loading
                                  ? Container(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Icon(
                                      Icons.settings_backup_restore_outlined,
                                      color: Theme.of(context).primaryColor,
                                    ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Retry",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 30,),
                      GestureDetector(
                        onTap: () {
                          context.read<PendingPaymentsBloc>().add(
                              PendingPaymentsRemoveEvent(
                                  this.widget.payment.unixSeconds,
                                  this.widget.payment.uchars));
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Delete",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
