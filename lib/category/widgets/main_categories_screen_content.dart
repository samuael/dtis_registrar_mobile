import "../../libs.dart";

class CategoriesDetail extends StatefulWidget {
  final Category category;
  // ranges from 0 - to-  5
  // 0= nothing is selected.
  // 5 = 5 item is selected,
  // final int selectionIndex ;
  const CategoriesDetail({required this.category, Key? key}) : super(key: key);

  @override
  _CategoriesDetailState createState() => _CategoriesDetailState();
}

class _CategoriesDetailState extends State<CategoriesDetail> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).primaryColor,
      child: Stack(
        children: [
          ListView(
            children: [
              // SizedBox(height: 150),
              CategoryInfo(
                category: widget.category,
              ),
              Container(
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  child: BlocBuilder<CategoryOptionIndexBloc, int>(
                      builder: (context, state) {
                    if (state == 2) {
                      index = 0;
                    } else if (state == 4) {
                      index = 1;
                    }
                    return Container(
                      width: double.infinity,
                      color: Theme.of(context).primaryColor,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  this.index = 0;
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
                                      color: this.index == 0
                                          ? Colors.white
                                          : Colors.white60,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Rounds",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: this.index == 0
                                            ? Colors.white
                                            : Colors.white60,
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
                                  this.index = 1;
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
                                    Icon(Icons.people_sharp,
                                        color: this.index == 1
                                            ? Colors.white
                                            : Colors.white60),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Students",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: this.index == 1
                                            ? Colors.white
                                            : Colors.white60,
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
                child: this.index == 1
                    ? Center(
                        child: Text(
                          "Ethiopia",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : CategoryRounds(
                        category: this.widget.category,
                      ),
              ),
              // CategoryRounds(
              //   category: this.widget.category,
              // ),
            ],
          ),
          CreateRoundScreen(this.widget.category.id),
        ],
      ),
    );
  }
}
