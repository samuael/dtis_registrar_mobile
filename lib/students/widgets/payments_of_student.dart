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

  @override
  Widget build(BuildContext context) {
    // ----------------------------------

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
          Positioned(
            left: 10,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 15,
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
              ElevatedButton(
                onPressed: () {
                  if (((context.watch<CategoriesBloc>().state
                                  as CategoriesListSuccess)
                              .getRoundByID(widget.student.roundID)!
                              .fee -
                          widget.student.paidAmount) >
                      0) {
                    try {
                      final amount = double.parse(paymentAmountController.text);
                      
                    } catch (e) {}
                  }
                },
                child: Text(
                  "Pay",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
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
      studentPaymentsBloc.add(StudentPaymentsLoad(widget.student.id!));
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
                  child: Column(children: [
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
                                    progressIndication = !progressIndication;
                                  });
                                  if (!(studentPaymentsBloc.state
                                      is StudentPaymentsLoaded)) {
                                    studentPaymentsBloc.add(StudentPaymentsLoad(
                                        widget.student.id!));
                                  }
                                },
                                icon: Icon(
                                  Icons.refresh_sharp,
                                  color: Theme.of(context).primaryColor,
                                ),
                              )),
                  ]),
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
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Icon(Icons.add),
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
