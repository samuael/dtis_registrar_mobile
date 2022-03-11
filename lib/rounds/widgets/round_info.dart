import 'package:flutter/services.dart';

import "../../libs.dart";

class RoundInfo extends StatefulWidget {
  final Round round;
  RoundInfo(
    this.round, {
    Key? key,
  }) : super(key: key);

  @override
  State<RoundInfo> createState() => _RoundInfoState();
}

class _RoundInfoState extends State<RoundInfo> {
  TextEditingController trainingHourController = TextEditingController();
  TextEditingController roundNumberController = TextEditingController();
  TextEditingController startingDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController langController = TextEditingController();
  TextEditingController feeController = TextEditingController();
  String reditMessage = "";
  Color reditColor = Colors.green;

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

  showRoundUpdateResult(
    RoundResponse resu,
    BuildContext context,
  ) {
    final snackBar = SnackBar(
      backgroundColor: resu.statusCode == 200 ? Colors.green : Colors.red,
      content: Text(
        resu.msg,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  bool activeRound = false;
  @override
  Widget build(BuildContext context) {
    activeRound = widget.round.active;
    final roundBloc = BlocProvider.of<RoundsBloc>(context);

    trainingHourController.text = "${widget.round.trainingHours}";
    roundNumberController.text = "${widget.round.roundNumber}";
    startingDateController.text = "${widget.round.startDate}";
    endDateController.text = "${widget.round.endDate}";
    langController.text = "${widget.round.lang}";
    feeController.text = "${widget.round.fee}";
    final roundInfoElements = [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Starting Date :",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Elegant TypeWriter",
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: 50,
          ),
          ...(context.watch<RoundOptionsIndexBloc>().state == 3
              ? [
                  Container(
                    width: 150,
                    height: 40,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      cursorColor: Theme.of(context).cursorColor,
                      autofocus: true,
                      controller: startingDateController,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          color: Color(0xFF006699),
                        ),
                        helperText: " eg. 5/6/2014",
                      ),
                    ),
                  ),
                ]
              : [
                  Text(
                    "${widget.round.startDate}",
                  )
                ]),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Last Date :     ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Elegant TypeWriter",
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: 50,
          ),
          ...(context.watch<RoundOptionsIndexBloc>().state == 3
              ? [
                  Container(
                    width: 150,
                    height: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      cursorColor: Theme.of(context).cursorColor,
                      autofocus: true,
                      controller: endDateController,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          color: Color(0xFF006699),
                        ),
                        helperText: "eg. 5/6/2014",
                      ),
                    ),
                  ),
                ]
              : [
                  Text(
                    "${widget.round.endDate}",
                  ),
                ]),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Communication Language: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Elegant TypeWriter",
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: 50,
          ),
          Text(
              "${(StaticDataStore.LanguageMap[widget.round.lang]) ?? "Unknown"}")
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Current Round Capital  :  ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Elegant TypeWriter",
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: 50,
          ),
          Text(
            "${widget.round.activeAmount}",
          )
        ],
      ),
      Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: activeRound ? Colors.green : Colors.red,
              ),
              color: activeRound ? Colors.green : Colors.red,
            ),
            margin: EdgeInsets.all(1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Status ${widget.round.active ? "Active" : "Finished"} ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Elegant TypeWriter",
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  "            ",
                )
              ],
            ),
          ),
        ),
        context.watch<RoundOptionsIndexBloc>().state == 3
            ? FlatButton(
                onPressed: () async {
                  if (this.widget.round.active) {
                    final result =
                        await roundBloc.deactivateRound(widget.round.id);
                    if (result.statusCode == 200) {
                      setState(() {
                        widget.round.active = true;
                        this.activeRound = widget.round.active;
                      });
                      context
                          .read<CategoriesBloc>()
                          .add(UpdateExistingRoundEvent(widget.round));
                    }
                    showRoundUpdateResult(
                      result,
                      context,
                    );
                    return;
                  } else {
                    final result =
                        await roundBloc.activateRound(widget.round.id);
                    if (result.statusCode == 200) {
                      setState(() {
                        widget.round.active = false;
                        this.activeRound = widget.round.active;
                      });
                      context
                          .read<CategoriesBloc>()
                          .add(UpdateExistingRoundEvent(widget.round));
                    }
                    showRoundUpdateResult(
                      result,
                      context,
                    );
                    return;
                  }
                },
                color: widget.round.active ? Colors.red : Colors.green,
                child: Text(
                  "${widget.round.active ? "Deactivate" : "Activate"}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Elegant TypeWriter",
                    color: Colors.white,
                  ),
                ),
              )
            : SizedBox(),
      ]),
      SizedBox(height: 20),
      context.watch<RoundOptionsIndexBloc>().state == 3
          ? ElevatedButton.icon(
              onPressed: () async {
                int val = 0;
                try {
                  if ((int.tryParse(trainingHourController.text) ?? 0) > 0 &&
                      (int.tryParse(roundNumberController.text) ?? 0) > 0 &&
                      startingDateController.text.length >= 8 &&
                      endDateController.text.length >= 8 &&
                      (double.tryParse(feeController.text) ?? -1) >= 0.0) {
                    if ((!isValidDateString(startingDateController.text)) &&
                        !isValidDateString(endDateController.text)) {
                      val = 32;
                    } else if (!isValidDateString(
                        startingDateController.text)) {
                      val = 33;
                    } else if (!isValidDateString(endDateController.text)) {
                      val = 34;
                    }
                    final response = await roundBloc.updateRound(
                      RoundUpdateModel(
                        id: this.widget.round.id,
                        trainingHours: int.parse(trainingHourController.text),
                        roundNumber: int.parse(roundNumberController.text),
                        endDate: endDateController.text,
                        startDate: startingDateController.text,
                        fee: double.parse(feeController.text),
                        lang: "amh",
                      ),
                    );
                    showRoundUpdateResult(
                      response,
                      context,
                    );
                    if (response.statusCode == 200) {
                      context
                          .read<CategoriesBloc>()
                          .add(UpdateExistingRoundEvent(response.round!));
                      return;
                    }
                    return;
                  }
                  if (!((int.tryParse(trainingHourController.text) ?? 0) > 0)) {
                    val = val | 1;
                  }
                  if (!((int.tryParse(roundNumberController.text) ?? 0) > 0)) {
                    val = val | 2;
                  }
                  if (!(startingDateController.text.length >= 8)) {
                    val = val | 4;
                  }
                  if (!(endDateController.text.length >= 8)) {
                    val = val | 8;
                  }
                  if (!((double.tryParse(feeController.text) ?? -1) >= 0.0)) {
                    val = val | 16;
                  }
                  setState(() {
                    this.reditMessage = "";
                  });

                  setState(() {
                    this.reditMessage = result[val];
                    this.reditColor = Colors.red;
                  });
                } catch (e) {
                  setState(() {
                    this.reditColor = Colors.red;
                    this.reditMessage = "please fill the fields appropriately";
                  });
                }
              },
              icon: Icon(Icons.update),
              label: Text(
                "Update",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Elegant TypeWriter",
                ),
              ),
            )
          : SizedBox(),
    ];

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: context.watch<RoundInfoVisibility>().state
              ? 0
              : (getDeviceType() == DeviceType.Phone
                  ? (MediaQuery.of(context).size.height * 0.36)
                  : (context.watch<RoundOptionsIndexBloc>().state == 3
                      ? MediaQuery.of(context).size.height * 0.38
                      : MediaQuery.of(context).size.height * 0.25)),
          color: Colors.white,
          width: double.infinity,
          child: context.watch<RoundInfoVisibility>().state
              ? SizedBox()
              : Stack(
                  children: [
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      // width : 200,
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Category :",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Elegant TypeWriter",
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    "${(context.read<CategoriesBloc>().state as CategoriesListSuccess).getCategoryByID(widget.round.categoryID)!.title}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      // fontStyle:FontStyle.italic,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Rounds Number :",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Elegant TypeWriter",
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  ...(context
                                              .watch<RoundOptionsIndexBloc>()
                                              .state ==
                                          3
                                      ? [
                                          Container(
                                            width: 150,
                                            height: 50,
                                            child: TextFormField(
                                              inputFormatters: [
                                                WhitelistingTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              keyboardType:
                                                  TextInputType.number,
                                              cursorColor:
                                                  Theme.of(context).cursorColor,
                                              autofocus: true,
                                              controller: roundNumberController,
                                              decoration: InputDecoration(
                                                labelStyle: TextStyle(
                                                  color: Color(0xFF006699),
                                                ),
                                                helperText:
                                                    "Round Number eg. 1 ",
                                              ),
                                            ),
                                          ),
                                        ]
                                      : [
                                          Text(
                                            "${widget.round.roundNumber}",
                                          ),
                                        ]),
                                ],
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Training Hours:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Elegant TypeWriter",
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    ...(context
                                                .watch<RoundOptionsIndexBloc>()
                                                .state ==
                                            3
                                        ? [
                                            Container(
                                              width: 150,
                                              height: 40,
                                              child: TextFormField(
                                                inputFormatters: [
                                                  WhitelistingTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                keyboardType:
                                                    TextInputType.number,
                                                cursorColor: Theme.of(context)
                                                    .cursorColor,
                                                autofocus: true,
                                                controller:
                                                    trainingHourController,
                                                // maxLength: 2000,
                                                // maxLines: 3,
                                                decoration: InputDecoration(
                                                  // icon: Icon(Icons.message),
                                                  labelStyle: TextStyle(
                                                    color: Color(0xFF006699),
                                                  ),
                                                  helperText:
                                                      "Training hours eg. 20 ",
                                                ),
                                              ),
                                            ),
                                          ]
                                        : [
                                            Text(
                                              "${widget.round.trainingHours} hours",
                                            )
                                          ]),
                                  ]),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Training Cost  :",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Elegant TypeWriter",
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    ...(context
                                                .watch<RoundOptionsIndexBloc>()
                                                .state ==
                                            3
                                        ? [
                                            Container(
                                              width: 150,
                                              height: 50,
                                              child: TextFormField(
                                                inputFormatters: [
                                                  WhitelistingTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                keyboardType:
                                                    TextInputType.number,
                                                cursorColor: Theme.of(context)
                                                    .cursorColor,
                                                autofocus: true,
                                                controller: feeController,
                                                decoration: InputDecoration(
                                                  labelStyle: TextStyle(
                                                    color: Color(0xFF006699),
                                                  ),
                                                  helperText:
                                                      "training price  eg. 7000",
                                                ),
                                              ),
                                            ),
                                            // TextButton.icon(
                                            //   onPressed: () async {

                                            //   },
                                            //   icon: Icon(
                                            //     Icons.next_plan_outlined,
                                            //   ),
                                            //   label: Text(
                                            //     "Update",
                                            //   ),
                                            // )
                                          ]
                                        : [
                                            Text(
                                              "${widget.round.fee}",
                                            ),
                                          ]),
                                  ]),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Created At:       ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Elegant TypeWriter",
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    "${widget.round.createdAt.toString()}",
                                  )
                                ],
                              ),
                              // SizedBox(height: 70),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Current Round Capital :",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Elegant TypeWriter",
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    "${widget.round.activeAmount}",
                                  )
                                ],
                              ),
                              ...(getDeviceType() == DeviceType.Phone
                                  ? roundInfoElements
                                  : [])
                            ],
                          ),
                          getDeviceType() == DeviceType.Desktop
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      ...(getDeviceType() == DeviceType.Phone
                                          ? []
                                          : roundInfoElements)
                                    ])
                              : SizedBox()
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
