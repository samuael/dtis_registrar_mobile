import "../../libs.dart";

class RoundsDetail extends StatefulWidget {
  final int roundID;
  const RoundsDetail(this.roundID, {Key? key}) : super(key: key);

  @override
  State<RoundsDetail> createState() => _RoundsDetailState();
}

class _RoundsDetailState extends State<RoundsDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).primaryColor,
      child: Stack(
        children: [
          ListView(
            children: [
              BlocBuilder<CategoriesBloc, CategoryBlocState>(
                builder: (context, state) {
                  if (!(state is CategoriesListSuccess)) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return RoundInfo(
                    (state).getRoundByID(this.widget.roundID)!,
                  );
                },
              ),
              GestureDetector(
                onTap: () {
                  context.read<RoundInfoVisibility>().changeState();
                },
                onVerticalDragStart: (vals) {
                  //
                },
                child: Container(
                  child: Image.asset(
                      context.watch<RoundInfoVisibility>().state
                          ? "assets/icon_images/drag-down.png"
                          : "assets/icon_images/drag-up.png",
                      width: 50,
                      height: 50,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              AnimatedContainer(
                duration: Duration(
                  milliseconds: 400,
                ),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  child: BlocBuilder<CategoryOptionIndexBloc, int>(
                      builder: (context, state) {
                    return Container(
                      width: double.infinity,
                      color: Theme.of(context).primaryColor,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  context
                                      .read<CategoryOptionIndexBloc>()
                                      .add(2);
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.batch_prediction,
                                      color: Colors.white60,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Rounds",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white60,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              width: 1,
                              height: 30,
                              child: SizedBox(
                                width: 1,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  context
                                      .read<CategoryOptionIndexBloc>()
                                      .add(4);
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 30,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.people_sharp,
                                      color: Colors.white60,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Students",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    );
                  }),
                ),
              ),
              AnimatedContainer(
                  duration: Duration(
                    seconds: 1,
                  ),
                  child: Center(
                    child: Text(
                      "Ethiopia",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              // CategoryRounds(
              //   category: this.widget.category,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
