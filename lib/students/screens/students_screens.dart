import "../../libs.dart";

class StudentsScreen extends StatefulWidget {
  static const String RouteName = "/students_screen";
  const StudentsScreen({Key? key}) : super(key: key);

  @override
  _StudentsScreenState createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Icon(Icons.access_alarm),
        ),
      ),
    );
  }
}
