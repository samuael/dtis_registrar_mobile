import "../../libs.dart";

class CategoriesScreen extends StatefulWidget {
  final int categoryId;
  static const String RouteName = "/categories_screen";
  const CategoriesScreen({required this.categoryId, Key? key})
      : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool zeBoolean = true;
  // int activatedSelection = 0;

  @override
  Widget build(BuildContext context) {
    final categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    if (!(categoriesBloc.state is CategoriesListSuccess)) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.RouteName, (route) => false);
    }
    categoriesBloc.add(CategoryStudentsQuantityEvent(
        (categoriesBloc.state as CategoriesListSuccess)
            .getCategoryByID(widget.categoryId)!
            .id));
    categoriesBloc.add(LoadRoundsOfACategoryEvent(
        (categoriesBloc.state as CategoriesListSuccess)
            .getCategoryByID(widget.categoryId)!
            .id));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [],
        centerTitle: true,
        title: Text(
          "Category | ${ (categoriesBloc.state as CategoriesListSuccess).getCategoryByID(widget.categoryId)!.title}",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Elegant TypeWriter",
          ),
        ),
      ),
      // drawer: MobileNavigations(),
      body: Container(
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
                                (zeBoolean ? 0.1 : 0.03),
                            height: MediaQuery.of(context).size.height * 0.88,
                            color: Colors.blue,
                            child: Column(
                              children: zeBoolean
                                  ? [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            context
                                                .read<CategoryOptionIndexBloc>()
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
                                                            CategoryOptionIndexBloc>()
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
                                                                    CategoryOptionIndexBloc>()
                                                                .state ==
                                                            1
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Colors.white,
                                                  ),
                                                  Text(
                                                    "Home",
                                                    style: TextStyle(
                                                      color: context
                                                                  .watch<
                                                                      CategoryOptionIndexBloc>()
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
                                                  Icon(
                                                    Icons.home,
                                                    color: context
                                                                .watch<
                                                                    CategoryOptionIndexBloc>()
                                                                .state ==
                                                            1
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Colors.white,
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            context
                                                .read<CategoryOptionIndexBloc>()
                                                .add(2);
                                          });
                                        },
                                        child: Container(
                                          color: context
                                                      .watch<
                                                          CategoryOptionIndexBloc>()
                                                      .state ==
                                                  2
                                              ? Colors.white
                                              : Theme.of(context).primaryColor,
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Rounds",
                                                style: TextStyle(
                                                  color: context
                                                              .watch<
                                                                  CategoryOptionIndexBloc>()
                                                              .state ==
                                                          2
                                                      ? Theme.of(context)
                                                          .primaryColor
                                                      : Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              Icon(
                                                Icons.model_training_rounded,
                                                color: context
                                                            .watch<
                                                                CategoryOptionIndexBloc>()
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
                                                .read<CategoryOptionIndexBloc>()
                                                .add(3);
                                          });
                                        },
                                        child: Container(
                                          color: context
                                                      .watch<
                                                          CategoryOptionIndexBloc>()
                                                      .state ==
                                                  3
                                              ? Colors.white
                                              : Theme.of(context).primaryColor,
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Edit",
                                                style: TextStyle(
                                                  color: context
                                                              .watch<
                                                                  CategoryOptionIndexBloc>()
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
                                                                CategoryOptionIndexBloc>()
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
                                                      CategoryOptionIndexBloc>()
                                                  .add(4);
                                            },
                                          );
                                        },
                                        child: Container(
                                          color: context
                                                      .watch<
                                                          CategoryOptionIndexBloc>()
                                                      .state ==
                                                  4
                                              ? Colors.white
                                              : Theme.of(context).primaryColor,
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "Students",
                                                  style: TextStyle(
                                                    color: context
                                                                .watch<
                                                                    CategoryOptionIndexBloc>()
                                                                .state ==
                                                            4
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Colors.white,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.person_search_outlined,
                                                  color: context
                                                              .watch<
                                                                  CategoryOptionIndexBloc>()
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
                                          setState(() {
                                            context
                                                .read<CategoryOptionIndexBloc>()
                                                .add(5);
                                          });
                                        },
                                        child: Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          color: context
                                                      .watch<
                                                          CategoryOptionIndexBloc>()
                                                      .state ==
                                                  5
                                              ? Colors.white
                                              : Theme.of(context).primaryColor,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "New Round",
                                                style: TextStyle(
                                                  color: context
                                                              .watch<
                                                                  CategoryOptionIndexBloc>()
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
                                                Icons.add,
                                                color: context
                                                            .watch<
                                                                CategoryOptionIndexBloc>()
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
                                  this.zeBoolean = !this.zeBoolean;
                                });
                              },
                              child: Icon(
                                this.zeBoolean
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
                BlocBuilder<CategoriesBloc, CategoryBlocState>(
                    builder: (contex, state) {
                  return AnimatedContainer(
                    duration: Duration(
                      milliseconds: 300,
                    ),
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width *
                        (zeBoolean ? 0.89 : 0.96),
                    height: MediaQuery.of(context).size.height * 0.90,
                    child: (state is CategoriesListSuccess)
                        ? CategoriesDetail(
                            category:
                                (categoriesBloc.state as CategoriesListSuccess)
                                    .getCategoryByID(widget.categoryId)!,
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
