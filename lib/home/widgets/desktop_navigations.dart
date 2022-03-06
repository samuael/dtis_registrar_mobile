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
              context.read<NavigationIndexBloc>().add(1);
            },
            child: Container(
              padding : EdgeInsets.symmetric(horizontal: 10 , vertical : 3),
              // color : Theme.of(context).primaryColorLight,
              child: Row(
                children: [
                  Icon(Icons.category, color: context.watch<NavigationIndexBloc>().state==1 ? Colors.amberAccent : Colors.white),
                  Text(
                    " Categories ",
                    style: TextStyle(
                      fontFamily: "Elegant TypeWriter-Bold",
                      fontWeight: FontWeight.bold,
                      color: context.watch<NavigationIndexBloc>().state==1 ? Colors.amberAccent : Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
                context.read<NavigationIndexBloc>().add(2);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 22,
              ),
              child: Row(
                children: [
                  Icon(Icons.people, color: context.watch<NavigationIndexBloc>().state==2 ? Colors.amberAccent : Colors.white),
                  Text(
                    "  Students",
                    style: TextStyle(
                      fontFamily: "Elegant TypeWriter-Bold",
                      fontWeight: FontWeight.bold,
                      color: context.watch<NavigationIndexBloc>().state==2 ? Colors.amberAccent : Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
                context.read<NavigationIndexBloc>().add(3);
            },
            child: Container(
              child: Row(
                children: [
                  Icon(Icons.app_registration, color: context.watch<NavigationIndexBloc>().state==3 ? Colors.amberAccent : Colors.white),
                  Text(
                    "  Registration",
                    style: TextStyle(
                      fontFamily: "Elegant TypeWriter-Bold",
                      fontWeight: FontWeight.bold,
                      color: context.watch<NavigationIndexBloc>().state==3 ? Colors.amberAccent : Colors.white,
                      fontSize: 17, 
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
                context.read<NavigationIndexBloc>().add(4);
            },
            child: Container(
              child: Row(
                children: [
                  Icon(Icons.document_scanner_sharp, color: context.watch<NavigationIndexBloc>().state==4 ? Colors.amberAccent : Colors.white),
                  Text(
                    "  Payments",
                    style: TextStyle(
                        fontFamily: "Elegant TypeWriter-Bold",
                        fontWeight: FontWeight.bold,
                        color: context.watch<NavigationIndexBloc>().state==4 ? Colors.amberAccent : Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
                context.read<NavigationIndexBloc>().add(5);
            },
            child: Container(
              child: Row(
                children: [
                  Icon(Icons.payment_rounded, color: context.watch<NavigationIndexBloc>().state==5 ? Colors.amberAccent : Colors.white),
                  Text(
                    " Payments",
                    style: TextStyle(
                      fontFamily: "Elegant TypeWriter-Bold",
                      fontWeight: FontWeight.bold,
                      color: context.watch<NavigationIndexBloc>().state==5 ? Colors.amberAccent : Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
                context.read<NavigationIndexBloc>().add(6);
            },
            child: Container(
              child: Row(
                children: [
                  Icon(Icons.notifications, color: context.watch<NavigationIndexBloc>().state==6 ? Colors.amberAccent : Colors.white),
                  Text(
                    "  Notification",
                    style: TextStyle(
                      fontFamily: "Elegant TypeWriter-Bold",
                      fontWeight: FontWeight.bold,
                      color: context.watch<NavigationIndexBloc>().state==6 ? Colors.amberAccent : Colors.white,
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
