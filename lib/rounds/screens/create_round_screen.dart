import 'package:flutter/services.dart';

import "../../libs.dart";

class CreateRoundScreen extends StatefulWidget {
  static const String RouteName = "CreateRoundFromCategory";
  final int categoryID;
  const CreateRoundScreen(this.categoryID, {Key? key}) : super(key: key);

  @override
  State<CreateRoundScreen> createState() => _CreateState();
}

class _CreateState extends State<CreateRoundScreen> {
  TextEditingController trainingHourController = TextEditingController();
  TextEditingController roundNumberController = TextEditingController();
  TextEditingController startingDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController trainingPriceController = TextEditingController();
  bool formMessageSuccess = true;
  bool activeRound = true;
  String formMessage = "------------------------------";
  List<String> result = [
    "",
    "please enter valid training hour", //  1
    "please enter valid round number", //  2
    "please enter valid training hour and round number", // 3
    "please enter valid starting date", //  4
    "please enter valid training hour and starting date", // 5
    "please enter valid starting date and round number ", // 6
    "please enter valid training hour, round number and starting date", // 7
    "please enter valid end date", //  8
    "please enter valid training hour and end date", // 9
    "please enter valid round number and end date", //  10
    "please enter valid training hour, round number and end date", //  11
    "please enter valid starting date and end date", //  12
    "please enter valid training hour, starting date, and end date", // 13
    "please enter valid round number, starting date, and end date ", // 14
    "please enter valid training hour, round number, startinf date, and end date", // 15
    "please enter valid training price", //  16
    "please enter valid training hour and training price", // 17
    "please enter valid round number and training price", // 18
    "please enter valid training hour, round number, and training price", // 19
    "please enter valid starting date and training price", // 20
    "please enter valid training hour, starting date, and training price", // 21
    "please enter valid round number, starting date, and training price", // 22
    "please enter valid training hour, round number,starting date,and training price", // 23
    "please enter valid end date and training price", // 24
    "please enter valid training hour, end date, and training price", // 25
    "please enter valid round number, end date, and training price", // 26
    "please enter valid training hour, round number,end date,and training price", // 27
    "please enter valid starting date, end date, and training price", // 28
    "please enter valid training hour, starting date, end date, and training price", // 29
    "please enter valid round number, starting date, end date, and training price", // 30
    "please enter valid training hour, round number, starting date, end date, training price", // 31
    "invalid starting date and end date", // 32
    "invalid starting date value", // 33
    "invalid end date value", // 34
  ];

  bool isValidDateString(String date) {
    List<String> vals = date.split("-");
    if (vals.length != 3) {
      vals = date.split("/");
      if (vals.length != 3) {
        vals = date.split(".");
        if (vals.length != 3) {
          vals = date.split(",");
          if (vals.length != 3) {
            return false;
          }
        }
      }
    }
    try {
      if ((int.parse(vals[0]) < 30) &&
          (int.parse(vals[0]) > 0) &&
          (int.parse(vals[1]) <= 13) &&
          (int.parse(vals[1]) > 0) &&
          (int.parse(vals[2]) > 1991) &&
          (int.parse(vals[2])) < 3000) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    final roundBloc = BlocProvider.of<RoundsBloc>(context);

    if (!(categoriesBloc.state is CategoriesListSuccess)) {
      return SizedBox();
    }

    final category = (categoriesBloc.state as CategoriesListSuccess)
        .categories
        .firstWhere((element) => element.id == widget.categoryID);
    return SafeArea(
      child: AnimatedContainer(
        duration: Duration(
          milliseconds: 600,
        ),
        // padding : EdgeInsets.only(left : 50),
        color: Colors.black12,
        height: context.watch<CategoryOptionIndexBloc>().state == 5 ? MediaQuery.of(context).size.height : 10,
        margin: EdgeInsets.only(
            top: context.watch<CategoryOptionIndexBloc>().state == 5
                ? 0
                : MediaQuery.of(context).size.height),
        child: Column(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: GestureDetector(
                onTap: () {
                  context.read<CategoryOptionIndexBloc>().add(2);
                },
                child: Container(
                  child: Icon(
                    Icons.cancel_sharp,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                        child: Text(
                          "Register Round   ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Elegant TypeWriter",
                            fontSize: 29,
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 40,
                        child: Text(
                          formMessage,
                          style: TextStyle(
                            fontFamily: "Elegant TypeWriter",
                            fontWeight: FontWeight.bold,
                            fontSize : 18,
                            color:
                                formMessageSuccess ? Colors.green : Colors.red,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 30),
                          Icon(Icons.info),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Category",
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            category.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      Row(children: [
                        SizedBox(width: 30),
                        Text(
                          "Training Hours",
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 150,
                          child: TextFormField(
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly
                            ],
                            keyboardType: TextInputType.number,
                            cursorColor: Theme.of(context).cursorColor,
                            controller: trainingHourController,
                            decoration: InputDecoration(
                              labelText: ' Training Hours',
                              labelStyle: TextStyle(
                                color: Color(0xFF006699),
                              ),
                              helperText: "Training Hours  eg. 30",
                              // suffixIcon: Icon(
                              //   Icons.check_circle,
                              // ),
                              // enabledBorder: OutlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: Color(0xFF6200EE)),
                              // ),
                            ),
                          ),
                        ),
                      ]),
                      Row(children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Round Number ",
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 150,
                          child: TextFormField(
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly
                            ],
                            keyboardType: TextInputType.number,
                            cursorColor: Theme.of(context).cursorColor,
                            autofocus: true,
                            controller: roundNumberController,
                            // maxLength: 2000,
                            // maxLines: 3,
                            decoration: InputDecoration(
                              // icon: Icon(Icons.message),
                              labelText: ' Round Number ',
                              labelStyle: TextStyle(
                                color: Color(0xFF006699),
                              ),
                              helperText: "Round Number er. 5",
                              // suffixIcon: Icon(
                              //   Icons.check_circle,
                              // ),
                              // enabledBorder: OutlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: Color(0xFF6200EE)),
                              // ),
                            ),
                          ),
                        ),
                      ]),
                      Row(children: [
                        SizedBox(width: 30),
                        Text(
                          "Starting Date    ",
                        ),
                        // TextField(
                        //     keyboardType: TextInputType.number,
                        //     decoration: InputDecoration(
                        //       hintText: "Training Hours  eg. 30",
                        //     ))
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 150,
                          child: TextField(
                            // controller: messageController,
                            // decoration: InputDecoration(labelText: " "),

                            keyboardType: TextInputType.number,
                            cursorColor: Theme.of(context).cursorColor,
                            autofocus: true,
                            controller: startingDateController,
                            // maxLength: 2000,
                            // maxLines: 3,
                            decoration: InputDecoration(
                              // icon: Icon(Icons.message),
                              labelText: ' Starting Date',
                              labelStyle: TextStyle(
                                color: Color(0xFF006699),
                              ),
                              helperText: "Starting Date  eg. 5/6/2014",
                              // suffixIcon: Icon(
                              //   Icons.check_circle,
                              // ),
                              // enabledBorder: OutlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: Color(0xFF6200EE)),
                              // ),
                            ),
                          ),
                        ),
                      ]),
                      Row(children: [
                        SizedBox(width: 30),
                        Text(
                          "End Date             ",
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 150,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            cursorColor: Theme.of(context).cursorColor,
                            autofocus: true,
                            controller: endDateController,
                            // maxLength: 2000,
                            // maxLines: 3,
                            decoration: InputDecoration(
                              // icon: Icon(Icons.message),
                              labelText: ' End Date ',
                              labelStyle: TextStyle(
                                color: Color(0xFF006699),
                              ),
                              helperText: "End Date  eg. 5/6/2014",
                              // suffixIcon: Icon(
                              //   Icons.check_circle,
                              // ),
                              // enabledBorder: OutlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: Color(0xFF6200EE)),
                              // ),
                            ),
                          ),
                        ),
                      ]),
                      Row(children: [
                        SizedBox(width: 30),
                        Text(
                          "Language            ",
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                            // width: 150,
                            child: DropdownButton(
                          // onChanged:
                          disabledHint: Text("Languages"),
                          autofocus: true,
                          value: 1,
                          // selectedItemBuilder: (context){
                          //   return Text("samuael",);
                          // },
                          items: [
                            DropdownMenuItem(
                              value: 1,
                              onTap: () {},
                              child: Text(
                                "English",
                              ),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              onTap: () {},
                              child: Text(
                                "Amharic",
                              ),
                            ),
                          ],
                        )),
                      ]),
                      Row(
                        children: [
                          SizedBox(width: 30),
                          Text(
                            "Training Price     ",
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 150,
                            child: TextFormField(
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              cursorColor: Theme.of(context).cursorColor,
                              autofocus: true,
                              controller: trainingPriceController,
                              // maxLength: 2000,
                              // maxLines: 3,
                              decoration: InputDecoration(
                                // icon: Icon(Icons.message),
                                labelText: ' Training Price ',
                                labelStyle: TextStyle(
                                  color: Color(0xFF006699),
                                ),
                                helperText: "training price  eg. 7000",
                                // suffixIcon: Icon(
                                //   Icons.check_circle,
                                // ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(color: Colors.red),
                                // ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 30),
                          Text(
                            "Active             ",
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          // Container(
                          //   width: 150,
                          //   child: Radio(
                          //     value:  activeRound? 1 : 0 ,
                          //     onChanged: (val) {
                          //       setState((){
                          //         activeRound = !activeRound;
                          //       });
                          //     },
                          //     groupValue: 1,
                          //   ),
                          // ),
                          Container(
                            width: 150,
                            child: Checkbox(
                              value: activeRound,
                              autofocus: true,
                              // value:  activeRound?  0 : 1 ,
                              onChanged: (val) {
                                setState(() {
                                  activeRound = !activeRound;
                                });
                              },
                              // groupValue: 1,
                            ),
                          ),
                        ],
                      ),
                      // IconButton(onPressed: (){}, icon: Icon(Icons.add), )
                      ElevatedButton.icon(
                        onPressed: () async {
                          // "^([0]?[1-9]|[1|2][0-9]|[3][0|1])[./-]([0]?[1-9]|[1][0-2])[./-]([0-9]{4}|[0-9]{2})");
                          int val = 0;
                          try {
                            if ((int.tryParse(trainingHourController.text) ??
                                        0) >
                                    0 &&
                                (int.tryParse(roundNumberController.text) ??
                                        0) >
                                    0 &&
                                startingDateController.text.length >= 8 &&
                                endDateController.text.length >= 8 &&
                                (double.tryParse(
                                            trainingPriceController.text) ??
                                        -1) >=
                                    0.0) {
                              if ((!isValidDateString(
                                      startingDateController.text)) &&
                                  !isValidDateString(endDateController.text)) {
                                val = 32;
                              } else if (!isValidDateString(
                                  startingDateController.text)) {
                                val = 33;
                              } else if (!isValidDateString(
                                  endDateController.text)) {
                                val = 34;
                              }
                              print(" Round is About to be created ");
                              final response = await roundBloc.createRound(
                                RoundInput(
                                  categoryID: this.widget.categoryID,
                                  trainingHours:
                                      int.parse(trainingHourController.text),
                                  roundNumber:
                                      int.parse(roundNumberController.text),
                                  active: true,
                                  endDate: endDateController.text,
                                  startDate: startingDateController.text,
                                  fee: double.parse(
                                      trainingPriceController.text),
                                  lang: "amh",
                                ),
                              );
                              if (response.statusCode == 200) {
                                context
                                    .read<CategoriesBloc>()
                                    .add(AddNewRoundEvent(response.round!));
                                setState(() {
                                  this.formMessage = "round created succesfuly";
                                  this.formMessageSuccess = true;
                                });
                                return;
                              } else {
                                print(this.formMessage = response.msg);
                                setState(() {
                                  this.formMessage = response.msg;
                                  this.formMessageSuccess = false;
                                });
                                return;
                              }
                            }
                            if (!((int.tryParse(trainingHourController.text) ??
                                    0) >
                                0)) {
                              val = val | 1;
                            }
                            if (!((int.tryParse(roundNumberController.text) ??
                                    0) >
                                0)) {
                              val = val | 2;
                            }
                            if (!(startingDateController.text.length >= 8)) {
                              val = val | 4;
                            }
                            if (!(endDateController.text.length >= 8)) {
                              val = val | 8;
                            }
                            if (!((double.tryParse(
                                        trainingPriceController.text) ??
                                    -1) >=
                                0.0)) {
                              val = val | 16;
                            }
                            setState(() {
                              this.formMessage = "";
                            });

                            setState(() {
                              this.formMessage = result[val];
                              this.formMessageSuccess = false;
                            });
                            //  --------------------------------------------
                          } catch (e) {
                            print( "THEEE ${e.toString()}");
                          }
                        },
                        icon: Icon(Icons.add),
                        autofocus: true,
                        label: Text(
                          "Create Round",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Elegant TypeWriter",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
