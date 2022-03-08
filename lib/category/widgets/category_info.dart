// import 'package:flutter/foundation.dart';
import "../../libs.dart";

class CategoryInfo extends StatefulWidget {
  final Category category;
  const CategoryInfo({required this.category, Key? key}) : super(key: key);

  @override
  _CategoryInfoState createState() =>
      _CategoryInfoState(category.title, category.shortTitle, category.fee);
}

class _CategoryInfoState extends State<CategoryInfo> {
  TextEditingController? categoryTitleController;
  TextEditingController? categoryShortTitleController;
  TextEditingController? trainingCostController;

  String title;
  String shortTitle;
  double trainingCost;
  _CategoryInfoState(this.title, this.shortTitle, this.trainingCost) {
    categoryTitleController = TextEditingController(text: this.title);
    categoryShortTitleController = TextEditingController(text: this.shortTitle);
    trainingCostController =
        TextEditingController(text: "${this.trainingCost}");
  }

  showCategoryUpdateResult(CategoryUpdateResponse resu, BuildContext context,
      Category category, CategoriesBloc categoryBlocProvider) {
    if (resu.status == 200) {
      categoryBlocProvider.add(
        CategoryUpdateEvent(resu.category!),
      );
    }
    final snackBar = SnackBar(
      backgroundColor: resu.status == 200 ? Colors.green : Colors.red,
      content: Text(
        resu.msg,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final categoryBlocProvider = BlocProvider.of<CategoriesBloc>(context);
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.28,
        color: Colors.white,
        width: double.infinity,
        child: Stack(
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
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Title :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Elegant TypeWriter",
                                fontSize: 18,
                              )),
                          SizedBox(
                            width: 50,
                          ),
                          ...(context.watch<CategoryOptionIndexBloc>().state ==
                                  3
                              ? [
                                  Container(
                                    width: 80,
                                    height: 20,
                                    child: TextField(
                                      controller: categoryTitleController,
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
                                      controller: categoryShortTitleController,
                                    ),
                                  ),
                                  TextButton.icon(
                                    onPressed: () async {
                                      if (categoryTitleController!.text != "" ||
                                          categoryShortTitleController!.text !=
                                              "") {
                                        Category input = Category(
                                          id: this.widget.category.id,
                                          title: categoryTitleController!
                                                      .text !=
                                                  ""
                                              ? categoryTitleController!.text
                                              : this.widget.category.title,
                                          shortTitle:
                                              categoryShortTitleController!
                                                          .text !=
                                                      ""
                                                  ? categoryShortTitleController!
                                                      .text
                                                  : this
                                                      .widget
                                                      .category
                                                      .shortTitle,
                                          fee: widget.category.fee,
                                          createdAt: widget.category.createdAt,
                                          numberOfRounds:
                                              widget.category.numberOfRounds,
                                          activeStudentsQuantity: widget
                                              .category.activeStudentsQuantity,
                                          imgurl: widget.category.imgurl,
                                        );
                                        this.widget.category.title =
                                            categoryTitleController!.text;
                                      }
                                      if (categoryShortTitleController!.text !=
                                          "") {
                                        this.widget.category.shortTitle =
                                            categoryShortTitleController!.text;
                                      }
                                      final resu = await categoryBlocProvider
                                          .updateCategory(this.widget.category);

                                      showCategoryUpdateResult(
                                          resu,
                                          context,
                                          widget.category,
                                          categoryBlocProvider);
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
                                    widget.category.title +
                                        "   ( ${widget.category.shortTitle} )",
                                  )
                                ]),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Number of Rounds :",
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
                              "${widget.category.numberOfRounds}",
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                        controller: trainingCostController,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    TextButton.icon(
                                      onPressed: () async {
                                        try {
                                          if (trainingCostController!.text !=
                                                  "" &&
                                              double.parse(
                                                      trainingCostController!
                                                          .text) >
                                                  0.0) {
                                            final resu = await categoryBlocProvider
                                                .updateCategoryFee(
                                                    this.widget.category.id,
                                                    double.parse(
                                                        trainingCostController!
                                                            .text));

                                            showCategoryUpdateResult(
                                                resu,
                                                context,
                                                widget.category,
                                                categoryBlocProvider);
                                          }
                                        } catch (e) {
                                          final snackBar = SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                              "Invalid Cost amount [[ ONLY NUMBER VALUES ARE ALLOWED ]]",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
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
                                      "${widget.category.fee}",
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
                            "${widget.category.createdAt.toString()}",
                          )
                        ],
                      ),
                      // SizedBox(height: 70),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Total Number of Students :",
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
                            widget.category.studentsQuantity == -1
                                ? "Unknown"
                                : " ${widget.category.studentsQuantity} ",
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Active Students :",
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
                            widget.category.activeStudentsQuantity == -1
                                ? "Unknown"
                                : "${widget.category.activeStudentsQuantity}",
                          )
                        ],
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
