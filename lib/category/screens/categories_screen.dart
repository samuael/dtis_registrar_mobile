import "../../libs.dart";

class CategoriesScreen extends StatefulWidget {
  final Category category;
  static const String RouteName = "/categories_screen";
  const CategoriesScreen({required this.category, Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool zeBoolean = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [],
        centerTitle: true,
        title: Text(
          "Category",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Elegant TypeWriter",
          ),
        ),
      ),
      drawer: MobileNavigations(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: Duration(
                          milliseconds: 300,
                        ),
                        width: MediaQuery.of(context).size.width *
                            (zeBoolean ? 0.13 : 0.03),
                        height: MediaQuery.of(context).size.height * 0.88,
                        color: Colors.blue,
                        child: Column(
                          children: zeBoolean
                              ? [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Setting One",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Setting One",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Setting One",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Setting One",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Setting One",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Setting One",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Setting One",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Setting One",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
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
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(
                    milliseconds: 300,
                  ),
                  color: Colors.brown,
                  width: MediaQuery.of(context).size.width *
                      (zeBoolean ? 0.87 : 0.97),
                  height: MediaQuery.of(context).size.height * 0.90,
                  child: CategoriesDetail(category: widget.category),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
