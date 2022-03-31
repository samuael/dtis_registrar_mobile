import 'package:flutter/services.dart';

import "../../libs.dart";

class StudentDetailsNavigation extends StatefulWidget {
  final Student student;
  const StudentDetailsNavigation(this.student, {Key? key}) : super(key: key);

  @override
  State<StudentDetailsNavigation> createState() =>
      _StudentDetailsNavigationState();
}

class _StudentDetailsNavigationState extends State<StudentDetailsNavigation> {
  int index = 1;

void changeWidget(int ind) {
      // if (index == 1) {
      // pageController.animateToPage(index + 1,
      //     duration: Duration(seconds: 2), curve: Curves.elasticOut);
      // setState(() {
      //   index = ind + 1;
      // });
      setState(() {
        index = ind;
      });
      // } else if (index == 2) {
      //   pageController.previousPage(
      //       duration: Duration(seconds: 2), curve: Curves.elasticOut);
      //   index = 1;
      // }
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 1000,
      height: 1000,
      child: Column(
        children: [
          // Container(
          //   height: 100,
          //   child: Column(
          //     crossAxisAlignment : CrossAxisAlignment.center,
          //     children: [

          // Center(
          //   child: Container(
          //     padding: EdgeInsets.symmetric(
          //       vertical: 8,
          //       horizontal: 20,
          //     ),
          //     color: Theme.of(context).primaryColor,
          //     child: Text(
          //       "Create Payment ",
          //       style: TextStyle(
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   left : 10,
          //   child: Container(
          //     child: ((context.watch<CategoriesBloc>().state
          //                 is CategoriesListSuccess) &&
          //             (context.watch<CategoriesBloc>().state
          //                         as CategoriesListSuccess)
          //                     .getRoundByID(widget.student.roundID) !=
          //                 null)
          //         ? Text(
          //             '''The Student is expected ${(context.watch<CategoriesBloc>().state as CategoriesListSuccess).getRoundByID(widget.student.roundID)!.fee - widget.student.paidAmount} Birr to pay''',
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //             ),
          //           )
          //         : CircularProgressIndicator(),
          //   ),
          // ),
          // Center(
          //   child: Row(
          //     mainAxisAlignment : MainAxisAlignment.center,
          //     children: [
          //     // ------------------------

          //     Container(
          //       width: 220,
          //       child: TextField(
          //         inputFormatters: [
          //           WhitelistingTextInputFormatter.digitsOnly
          //         ],
          //         keyboardType: TextInputType.number,
          //         cursorColor: Theme.of(context).cursorColor,
          //         // controller: birthMonthController,
          //         autofocus: true,
          //         decoration: InputDecoration(
          //           border: new OutlineInputBorder(
          //             borderSide: new BorderSide(
          //               color: Colors.red, // : Colors.teal,
          //             ),
          //           ),
          //           labelText: ' Amount ',
          //           labelStyle: TextStyle(
          //             color: Colors.red, // : Color(0xFF006699),
          //             fontSize: 12,
          //           ),
          //         ),
          //       ),
          //     ),
          //     SizedBox(width: 20),
          //     ElevatedButton(
          //       onPressed: () {},
          //       child: Text(
          //         "Pay",
          //         style: TextStyle(
          //           color: Colors.white,
          //         ),
          //       ),
          //       style: ButtonStyle(
          //         padding: MaterialStateProperty.all<EdgeInsets>(
          //           EdgeInsets.symmetric(
          //             horizontal: 30,
          //             vertical: 20,
          //           ),
          //         ),
          //       ),
          //     )
          //   ]),
          // )
          //     ],
          //   ),
          // ),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              // duration: Duration(seconds: 1),
              color: Theme.of(context).primaryColor,
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () {
                      changeWidget(1);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icon_images/moneys.png",
                            height: 30,
                            width: 30,
                            color: index == 1 ? Colors.white : Colors.white60,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Payment",
                            style: TextStyle(
                              color: index == 1 ? Colors.white : Colors.white60,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 1,
                    child: Container(
                      height: 20,
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeWidget(2);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icon_images/icons8-transaction-50.png",
                            height: 30,
                            width: 30,
                            color: index == 2 ? Colors.white : Colors.white60,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Pending Payment",
                            style: TextStyle(
                              color: index == 2 ? Colors.white : Colors.white60,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 1,
                    child: Container(
                      height: 20,
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                  // ---
                  GestureDetector(
                    onTap: () {
                      changeWidget(3);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.document_scanner_outlined,
                            color: index == 3 ? Colors.white : Colors.white60,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Documents",
                            style: TextStyle(
                              color: index == 3 ? Colors.white : Colors.white60,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      child: Text(
                        "",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Center(
                child: index == 1
                    ? Center(child: Text("HI"))
                    : (index == 2
                        ? Center(child: Text("HIUI"))
                        : Center(child: Text("HIUI")))),
          ),
          // ),
        ],
      ),
    );
  }
}
