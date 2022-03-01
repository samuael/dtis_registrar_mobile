import '../../libs.dart';

class MobileNavigations extends StatefulWidget {
  const MobileNavigations({Key? key}) : super(key: key);

  @override
  _MobileNavigationsState createState() => _MobileNavigationsState();
}

class _MobileNavigationsState extends State<MobileNavigations> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      child: Container(
        color: Theme.of(context).primaryColorDark,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 30,
                bottom: 20,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                children: [],
              ),
            ),
            ListTile(
              tileColor: Theme.of(context).primaryColorLight,
              leading: Icon(
                Icons.category,
                color: Colors.white,
              ),
              title: Text(
                "Categories",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Elegant TypeWriter",
                ),
              ),
              onTap: () {
                context.read<NavigationIndexBloc>().add(1);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person_add,
                color: Colors.white,
              ),
              title: Text(
                "Students",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Elegant TypeWriter",
                ),
              ),
              onTap: () {
                context.read<NavigationIndexBloc>().add(2);
              },
            ),
            // "Deactivate": [Icons.settings, "/"],
            ListTile(
              leading: Icon(
                Icons.app_registration,
                color: Colors.white,
              ),
              title: Text(
                "Registration",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Elegant TypeWriter",
                ),
              ),
              onTap: () {
                context.read<NavigationIndexBloc>().add(3);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.notifications_active,
                color: Colors.white,
              ),
              title: Text(
                " Notifications ",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Elegant TypeWriter",
                ),
              ),
              onTap: () {
                context.read<NavigationIndexBloc>().add(4);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.document_scanner_sharp,
                color: Colors.white,
              ),
              title: Text(
                " Payments",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Elegant TypeWriter",
                ),
              ),
              onTap: () {
                context.read<NavigationIndexBloc>().add(5);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: Text(
                " Log out",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Elegant TypeWriter",
                ),
              ),
              onTap: () {
                context.read<NavigationIndexBloc>().add(6);
              },
            )
          ],
        ),
      ),
    );
  }
}
