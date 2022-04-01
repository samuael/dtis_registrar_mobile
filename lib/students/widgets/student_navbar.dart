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
    setState(() {
      index = ind;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 1000,
      child: Column(
        children: [
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
                    ? PaymentsOfStudent(widget.student)
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
