import "../../libs.dart";

class StudentDetailWidget extends StatefulWidget {
  const StudentDetailWidget({Key? key}) : super(key: key);

  @override
  State<StudentDetailWidget> createState() => _StudentDetailWidgetState();
}

class _StudentDetailWidgetState extends State<StudentDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
    );
  }
}
