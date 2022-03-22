import "../../libs.dart";

class StudentDetailScreen extends StatefulWidget {
  const StudentDetailScreen({ Key? key }) : super(key: key);

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : StudentDetailWidget()
    );
  }
}