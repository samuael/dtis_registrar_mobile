import "../../libs.dart";

class DesktopNavigationBar extends StatefulWidget {
  const DesktopNavigationBar({Key? key}) : super(key: key);

  @override
  Desktop_NavigationBarState createState() => Desktop_NavigationBarState();
}

class Desktop_NavigationBarState extends State<DesktopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              // -----------------------
            },
            child: Container(
              child: Row(
                children: [
                  Icon(Icons.category, color: Colors.white),
                  Text(
                    "  Categories",
                    style: TextStyle(
                      fontFamily: "Elegant TypeWriter-Bold",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 22,
              ),
              child: Row(
                children: [
                  Icon(Icons.people, color: Colors.white),
                  Text(
                    "  Students",
                    style: TextStyle(
                      fontFamily: "Elegant TypeWriter-Bold",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              child: Row(
                children: [
                  Icon(Icons.app_registration, color: Colors.white),
                  Text(
                    "  Registration",
                    style: TextStyle(
                      fontFamily: "Elegant TypeWriter-Bold",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              child: Row(
                children: [
                  Icon(Icons.document_scanner_sharp, color: Colors.white),
                  Text(
                    "  Documents",
                    style: TextStyle(
                        fontFamily: "Elegant TypeWriter-Bold",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              child: Row(
                children: [
                  Icon(Icons.album_rounded, color: Colors.white),
                  Text(
                    " Rounds",
                    style: TextStyle(
                      fontFamily: "Elegant TypeWriter-Bold",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              child: Row(
                children: [
                  Icon(Icons.notifications, color: Colors.white),
                  Text(
                    "  Notification",
                    style: TextStyle(
                      fontFamily: "Elegant TypeWriter-Bold",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
