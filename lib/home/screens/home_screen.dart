import "../../libs.dart";

class HomeScreen extends StatefulWidget {
  // RouteName ...
  static const String RouteName = "/homeScreenPath";

  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> navigations = [
    CategoryLists(),
    StudentDetailWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [],
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Elegant TypeWriter",
          ),
        ),
      ),
      drawer: MobileNavigations(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                StaticDataStore.DType == DeviceType.Tablet ||
                        StaticDataStore.DType == DeviceType.Phone
                    ? Flexible(
                        flex: 7,
                        child: Container(
                          child: null,
                        ),
                      )
                    : Flexible(
                        flex: 7,
                        child: DesktopNavigationBar(),
                      ),
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        margin: EdgeInsets.only(
                          // right: 20,
                          top: 2,
                        ),
                        // width: 80,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                        child: Image.asset(
                          "assets/icon_images/car-middle.gif",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<NavigationIndexBloc, int>(
            builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height * .82,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: navigations[state - 1],
              );
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 3,
            ),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                " Drivers Training Institute Registration System ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
