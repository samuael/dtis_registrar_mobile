import "../../libs.dart";

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  _StudentsPageState createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: [
            Container(
              color: Colors.blue,
              width: MediaQuery.of(context).size.width * 0.2,
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
