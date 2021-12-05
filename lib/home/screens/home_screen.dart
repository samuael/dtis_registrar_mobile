import "../../libs.dart";

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          Icon(
            Icons.more,
            color: Colors.blue,
            size: 40,
          )
        ],
        centerTitle: true,
        title: Text(
          "Welcome to DTIS",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Stack(children: [
          Container(
              color: Theme.of(context).primaryColor,
              height: MediaQuery.of(context).size.height * 0.9,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.elliptical(300, 100)),
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.elliptical(300, 100)),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      color: Colors.white,
                    ),
                  )
                ],
              )),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.height * 0.5,
              child: Center(
                child: Card(
                  elevation: 5,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              " Home Screen ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
