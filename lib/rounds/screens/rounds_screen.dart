import "../../libs.dart";

class RoundsScreen extends StatefulWidget {
  static const String RouteName = "/round_screen";

  final int roundID;
  RoundsScreen(this.roundID);

  @override
  State<RoundsScreen> createState() {
    return RoundsScreenState();
  }
}

class RoundsScreenState extends State<RoundsScreen> {
  bool zeboolean = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [],
        centerTitle: true,
        title: Text(
          "Rounds",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Elegant TypeWriter",
          ),
        ),
      ),
      // drawer: MobileNavigations(),
      body: BlocBuilder<CategoriesBloc, CategoryBlocState>(
          builder: (context, state) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      child: SingleChildScrollView(
                        child: Stack(
                          children: [
                            AnimatedContainer(
                              duration: Duration(
                                milliseconds: 300,
                              ),
                              width: MediaQuery.of(context).size.width *
                                  (zeboolean ? 0.13 : 0.03),
                              height: MediaQuery.of(context).size.height * 0.88,
                              color: Colors.blue,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: zeboolean
                                    ? [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              context
                                                  .read<RoundOptionsIndexBloc>()
                                                  .add(1);
                                            });
                                          },
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                              color: context
                                                          .watch<
                                                              RoundOptionsIndexBloc>()
                                                          .state ==
                                                      1
                                                  ? Colors.white
                                                  : Theme.of(context)
                                                      .primaryColor,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Icon(
                                                      Icons.arrow_left,
                                                      color: context
                                                                  .watch<
                                                                      RoundOptionsIndexBloc>()
                                                                  .state ==
                                                              1
                                                          ? Theme.of(context)
                                                              .primaryColor
                                                          : Colors.white,
                                                    ),
                                                    Text(
                                                      "Back",
                                                      style: TextStyle(
                                                        color: context
                                                                    .watch<
                                                                        RoundOptionsIndexBloc>()
                                                                    .state ==
                                                                1
                                                            ? Theme.of(context)
                                                                .primaryColor
                                                            : Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    // Icon(
                                                    //   Icons.category_outlined,
                                                    //   color: context
                                                    //               .watch<
                                                    //                   RoundOptionsIndexBloc>()
                                                    //               .state ==
                                                    //           1
                                                    //       ? Theme.of(context)
                                                    //           .primaryColor
                                                    //       : Colors.white,
                                                    // ),
                                                  ]),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              context
                                                  .read<RoundOptionsIndexBloc>()
                                                  .add(2);
                                            });
                                          },
                                          child: Container(
                                            color: context
                                                        .watch<
                                                            RoundOptionsIndexBloc>()
                                                        .state ==
                                                    2
                                                ? Colors.white
                                                : Theme.of(context)
                                                    .primaryColor,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "Payments",
                                                  style: TextStyle(
                                                    color: context
                                                                .watch<
                                                                    RoundOptionsIndexBloc>()
                                                                .state ==
                                                            2
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                Image.asset(
                                                  "assets/icon_images/moneys.png",
                                                  height: 30,
                                                  width: 30,
                                                  color: context
                                                              .watch<
                                                                  RoundOptionsIndexBloc>()
                                                              .state ==
                                                          2
                                                      ? Theme.of(context)
                                                          .primaryColor
                                                      : Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              context
                                                  .read<RoundOptionsIndexBloc>()
                                                  .add(3);
                                            });
                                          },
                                          child: Container(
                                            color: context
                                                        .watch<
                                                            RoundOptionsIndexBloc>()
                                                        .state ==
                                                    3
                                                ? Colors.white
                                                : Theme.of(context)
                                                    .primaryColor,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "Edit",
                                                  style: TextStyle(
                                                    color: context
                                                                .watch<
                                                                    RoundOptionsIndexBloc>()
                                                                .state ==
                                                            3
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.edit_rounded,
                                                  color: context
                                                              .watch<
                                                                  RoundOptionsIndexBloc>()
                                                              .state ==
                                                          3
                                                      ? Theme.of(context)
                                                          .primaryColor
                                                      : Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(
                                              () {
                                                context
                                                    .read<
                                                        RoundOptionsIndexBloc>()
                                                    .add(4);
                                              },
                                            );
                                          },
                                          child: Container(
                                            color: context
                                                        .watch<
                                                            RoundOptionsIndexBloc>()
                                                        .state ==
                                                    4
                                                ? Colors.white
                                                : Theme.of(context)
                                                    .primaryColor,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Students",
                                                    style: TextStyle(
                                                      color: context
                                                                  .watch<
                                                                      RoundOptionsIndexBloc>()
                                                                  .state ==
                                                              4
                                                          ? Theme.of(context)
                                                              .primaryColor
                                                          : Colors.white,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .person_search_outlined,
                                                    color: context
                                                                .watch<
                                                                    RoundOptionsIndexBloc>()
                                                                .state ==
                                                            4
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Colors.white,
                                                  ),
                                                ]),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            // context
                                            //     .read<RoundOptionsIndexBloc>()
                                            //     .add(5);
                                            // if (!(context
                                            //     .watch<RoundInfoVisibility>()
                                            //     .state)) {
                                            //   context
                                            //       .read<RoundInfoVisibility>()
                                            //       .changeState();
                                            // }
                                            setState(
                                              () {
                                                context
                                                    .read<
                                                        RoundOptionsIndexBloc>()
                                                    .add(4);
                                              },
                                            );
                                            try {
                                              if (getDeviceType() ==
                                                  DeviceType.Phone) {
                                                Navigator.of(context).pushNamed(
                                                  StudentRegistrationScreen
                                                      .RouteName,
                                                  arguments: {
                                                    "round_id": widget.roundID
                                                  },
                                                );
                                              }
                                            } catch (e) {}
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 10,
                                              horizontal: 20,
                                            ),
                                            color: context
                                                        .watch<
                                                            RoundOptionsIndexBloc>()
                                                        .state ==
                                                    5
                                                ? Colors.white
                                                : Theme.of(context)
                                                    .primaryColor,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "Register Student",
                                                  style: TextStyle(
                                                    color: context
                                                                .watch<
                                                                    RoundOptionsIndexBloc>()
                                                                .state ==
                                                            5
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.person_add,
                                                  color: context
                                                              .watch<
                                                                  RoundOptionsIndexBloc>()
                                                              .state ==
                                                          5
                                                      ? Theme.of(context)
                                                          .primaryColor
                                                      : Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              context
                                                  .read<RoundOptionsIndexBloc>()
                                                  .add(6);
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            color: context
                                                        .watch<
                                                            RoundOptionsIndexBloc>()
                                                        .state ==
                                                    6
                                                ? Colors.white
                                                : Theme.of(context)
                                                    .primaryColor,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "Documents",
                                                  style: TextStyle(
                                                    color: context
                                                                .watch<
                                                                    RoundOptionsIndexBloc>()
                                                                .state ==
                                                            6
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons
                                                      .document_scanner_outlined,
                                                  color: context
                                                              .watch<
                                                                  RoundOptionsIndexBloc>()
                                                              .state ==
                                                          6
                                                      ? Theme.of(context)
                                                          .primaryColor
                                                      : Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              context
                                                  .read<RoundOptionsIndexBloc>()
                                                  .add(7);
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            color: context
                                                        .watch<
                                                            RoundOptionsIndexBloc>()
                                                        .state ==
                                                    7
                                                ? Colors.white
                                                : Theme.of(context)
                                                    .primaryColor,
                                            child: ListTile(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.spaceBetween,
                                              // children: [
                                              title: Text(
                                                "Reports",
                                                style: TextStyle(
                                                  color: context
                                                              .watch<
                                                                  RoundOptionsIndexBloc>()
                                                              .state ==
                                                          7
                                                      ? Theme.of(context)
                                                          .primaryColor
                                                      : Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              trailing: Image.asset(
                                                // Icons.
                                                "assets/icon_images/icons8-report-64.png",
                                                width: 30,
                                                height: 30,
                                                color: context
                                                            .watch<
                                                                RoundOptionsIndexBloc>()
                                                            .state ==
                                                        7
                                                    ? Theme.of(context)
                                                        .primaryColor
                                                    : Colors.white,
                                              ),
                                              // ],
                                            ),
                                          ),
                                        ),
                                      ]
                                    : [],
                              ),
                            ),
                            Positioned(
                              top: 20,
                              right: 20,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    this.zeboolean = !this.zeboolean;
                                  });
                                },
                                child: Icon(
                                  this.zeboolean
                                      ? Icons.arrow_back_ios_outlined
                                      : Icons.arrow_forward_ios_outlined,
                                  color: Colors.white,
                                  size: 27,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(
                      milliseconds: 300,
                    ),
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width *
                        (zeboolean ? 0.86 : 0.93),
                    height: MediaQuery.of(context).size.height * 0.90,
                    child: (state is CategoriesListSuccess)
                        ? RoundsDetail(this.widget.roundID)
                        : Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
