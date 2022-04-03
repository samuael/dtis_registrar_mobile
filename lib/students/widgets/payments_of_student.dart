import 'package:flutter/services.dart';

import "../../libs.dart";

class PaymentsOfStudent extends StatefulWidget {
  final Student student;
  const PaymentsOfStudent(this.student, {Key? key}) : super(key: key);

  @override
  State<PaymentsOfStudent> createState() => _PaymentsOfStudentState();
}

class _PaymentsOfStudentState extends State<PaymentsOfStudent> {
  TextEditingController paymentAmountController = TextEditingController();

  String paymentMessage = "";
  Color paymentMessageColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    // ----------------------------------------------------------------------
    final studentPaymentBloc = BlocProvider.of<StudentPaymentsBloc>(context);
    final pendingPaymensBloc = BlocProvider.of<PendingPaymentsBloc>(context);

    final netRemaining =
        (context.watch<CategoriesBloc>().state as CategoriesListSuccess)
                .getRoundByID(widget.student.roundID)!
                .fee -
            widget.student.paidAmount;
    final newPayment = Container(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            ''' $paymentMessage ''',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: paymentMessageColor,
            ),
          ),
          Positioned(
            left: 10,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 40,
              ),
              child: ((context.watch<CategoriesBloc>().state
                          is CategoriesListSuccess) &&
                      (context.watch<CategoriesBloc>().state
                                  as CategoriesListSuccess)
                              .getRoundByID(widget.student.roundID) !=
                          null)
                  ? Text(
                      '''The Student is expected to pay : << ${netRemaining < 0 ? 0 : netRemaining} Birr >>''',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  : CircularProgressIndicator(),
            ),
          ),
          Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 220,
                child: TextField(
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  cursorColor: Theme.of(context).cursorColor,
                  controller: paymentAmountController,
                  enabled: ((context.watch<CategoriesBloc>().state
                                  as CategoriesListSuccess)
                              .getRoundByID(widget.student.roundID)!
                              .fee -
                          widget.student.paidAmount) >
                      0,
                  // controller: birthMonthController,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.red, // : Colors.teal,
                      ),
                    ),
                    labelText: ' Amount ',
                    labelStyle: TextStyle(
                      color: Theme.of(context)
                          .primaryColor, // : Color(0xFF006699),
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  if (netRemaining > 0) {
                    try {
                      // -------------------------------------------------------
                      final amount = double.parse(paymentAmountController.text);
                      paymentAmountController.text = "";
                      int unix = (DateTime.now().millisecondsSinceEpoch / 1000)
                          .round();
                      String uniqueChars = getRandomString(2);
                      final payment = PayInInput(amount, widget.student.id!,
                          unix, this.widget.student.roundID, uniqueChars);
                      final paymentResult =
                          studentPaymentBloc.makePayment(payment);
                      // -----------------------------------------
                      paymentResult.then((paymentResult) {
                        print(paymentResult.statusCode);
                        if (paymentResult.statusCode == 201) {
                          studentPaymentBloc.add(
                            StudentPaymentAddEvent(paymentResult.payment!),
                          );
                          widget.student.paidAmount += payment.amount;
                        } else if (!(paymentResult.statusCode == 409)) {
                          pendingPaymensBloc
                              .add(PendingPaymentsAddEvent(payment));
                        }
                      });
                    } catch (e) {
                      paymentMessage = "invalid payment value";
                      paymentMessageColor = Colors.red;
                    }
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      "Pay",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );

    final studentPaymentsBloc = BlocProvider.of<StudentPaymentsBloc>(context);
    if (!(studentPaymentsBloc.state is StudentPaymentsLoaded)) {
      studentPaymentsBloc.add(StudentPaymentsLoadEvent(widget.student.id!));
    }

    bool progressIndication = false;
    return Column(
      children: [
        newPayment,
        BlocBuilder<StudentPaymentsBloc, StudentPaymentsState>(
            builder: (context, state) {
          if (state is StudentPaymentsLoaded) {
            // if (state.paymentMap[widget.studentID] != null) {
            if ((state.paymentMap[widget.student.id!] ?? []).length == 0) {
              return Container(
                margin: EdgeInsets.only(
                  top: 100,
                ),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "No Payment Transaction was found",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      !(getDeviceType() == DeviceType.Desktop)
                          ? SizedBox()
                          : (progressIndication
                              ? CircularProgressIndicator()
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      progressIndication = true;
                                    });
                                    if (!(studentPaymentsBloc.state
                                        is StudentPaymentsLoaded)) {
                                      studentPaymentsBloc.add(
                                          StudentPaymentsLoadEvent(
                                              widget.student.id!));
                                    }
                                  },
                                  icon: Icon(
                                    Icons.refresh_sharp,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )),
                    ],
                  ),
                ),
              );
            } else {
              return Container(
                child: Stack(
                  children: [
                    Column(
                      children: (state.paymentMap[widget.student.id!] ?? [])
                          .map<PayinItem>((e) {
                        return PayinItem(e);
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
