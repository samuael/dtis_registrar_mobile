import "../../libs.dart";

class StudentItem extends StatefulWidget {
  final Student student;
  const StudentItem({ required this.student , Key? key }) : super(key: key);

  @override
  State<StudentItem> createState() => _StudentItemState();
}

class _StudentItemState extends State<StudentItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(

    );
  }
}