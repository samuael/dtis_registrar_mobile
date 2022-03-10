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
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        height: context.watch<RoundInfoVisibility>().state ? 0 : MediaQuery.of(context).size.height * 0.35,
        color: Colors.white,
        width: double.infinity,
        child: context.watch<RoundInfoVisibility>().state
            ? SizedBox()
            : Stack(
                children: [
                  Container(
                    // width : 200,
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Category :",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Elegant TypeWriter",
                                      fontSize: 18,
                                    )),
                                SizedBox(
                                  width: 50,
                                ),
                                ...(context
                                            .watch<CategoryOptionIndexBloc>()
                                            .state ==
                                        3
                                    ? [
                                        Container(
                                          width: 80,
                                          height: 20,
                                          child: TextField(
                                            // controller: categoryTitleController,
                                            enabled: true,
                                            autofocus: true,
                                          ),
                                        ),
                                        Text(
                                          "Short Title :",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Elegant TypeWriter",
                                            fontSize: 18,
                                          ),
                                        ),
                                        Container(
                                          width: 75,
                                          height: 20,
                                          child: TextField(
                                              // controller: categoryShortTitleController,
                                              ),
                                        ),
                                        TextButton.icon(
                                          onPressed: () async {
                                            // if (categoryTitleController!.text != "" ||
                                            //     categoryShortTitleController!.text !=
                                            //         "") {
                                            //   Category input = Category(
                                            //     id: this.widget.category.id,
                                            //     title: categoryTitleController!
                                            //                 .text !=
                                            //             ""
                                            //         ? categoryTitleController!.text
                                            //         : this.widget.category.title,
                                            //     shortTitle:
                                            //         categoryShortTitleController!
                                            //                     .text !=
                                            //                 ""
                                            //             ? categoryShortTitleController!
                                            //                 .text
                                            //             : this
                                            //                 .widget
                                            //                 .category
                                            //                 .shortTitle,
                                            //     fee: widget.category.fee,
                                            //     createdAt: widget.category.createdAt,
                                            //     numberOfRounds:
                                            //         widget.category.numberOfRounds,
                                            //     activeStudentsQuantity: widget
                                            //         .category.activeStudentsQuantity,
                                            //     imgurl: widget.category.imgurl,
                                            //   );
                                            //   this.widget.category.title =
                                            //       categoryTitleController!.text;
                                            // }
                                            // if (categoryShortTitleController!.text !=
                                            //     "") {
                                            //   this.widget.category.shortTitle =
                                            //       categoryShortTitleController!.text;
                                            // }
                                            // final resu = await categoryBlocProvider
                                            //     .updateCategory(this.widget.category);

                                            // showCategoryUpdateResult(
                                            //     resu,
                                            //     context,
                                            //     widget.category,
                                            //     categoryBlocProvider);
                                          },
                                          icon: Icon(
                                            Icons.next_plan_outlined,
                                          ),
                                          label: Text(
                                            "Update",
                                          ),
                                        )
                                      ]
                                    : [
                                        Text(
                                          "${(context.read<CategoriesBloc>().state as CategoriesListSuccess).getCategoryByID(widget.round.categoryID)!.title}",
                                        )
                                      ]),
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
                                  Text(
                                    "${widget.round.roundNumber}",
                                  )
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Training Hours :",
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
                                    "${widget.round.trainingHours}",
                                  )
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
                                              .watch<CategoryOptionIndexBloc>()
                                              .state ==
                                          3
                                      ? [
                                          Container(
                                            width: 70,
                                            height: 20,
                                            child: TextField(
                                              // controller: trainingCostController,
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),
                                          TextButton.icon(
                                            onPressed: () async {
                                              // try {
                                              //   if (trainingCostController!.text !=
                                              //           "" &&
                                              //       double.parse(
                                              //               trainingCostController!
                                              //                   .text) >
                                              //           0.0) {
                                              //     final resu = await categoryBlocProvider
                                              //         .updateCategoryFee(
                                              //             this.widget.category.id,
                                              //             double.parse(
                                              //                 trainingCostController!
                                              //                     .text));

                                              //     showCategoryUpdateResult(
                                              //         resu,
                                              //         context,
                                              //         widget.category,
                                              //         categoryBlocProvider);
                                              //   }
                                              // } catch (e) {
                                              //   final snackBar = SnackBar(
                                              //     backgroundColor: Colors.red,
                                              //     content: Text(
                                              //       "Invalid Cost amount [[ ONLY NUMBER VALUES ARE ALLOWED ]]",
                                              //       style: TextStyle(
                                              //         color: Colors.white,
                                              //       ),
                                              //     ),
                                              //   );
                                              //   ScaffoldMessenger.of(context)
                                              //       .showSnackBar(snackBar);
                                              // }
                                            },
                                            icon: Icon(
                                              Icons.next_plan_outlined,
                                            ),
                                            label: Text(
                                              "Update",
                                            ),
                                          )
                                        ]
                                      : [
                                          Text(
                                            "${widget.round.fee}",
                                          ),
                                        ]),
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Created At             :",
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                Text(
                                  "${widget.round.startDate}",
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Last Date ",
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
                                  "${widget.round.endDate}",
                                )
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Students Qunatity   ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Elegant TypeWriter",
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text("${widget.round.students}")
                              ],
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: widget.round.active
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  color: widget.round.active
                                      ? Colors.green
                                      : Colors.red,
                                ),
                                margin: EdgeInsets.all(1),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      " ${widget.round.active ? "Active" : "Finished"} ",
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
