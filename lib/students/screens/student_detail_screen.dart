import "../../libs.dart";

class StudentDetailScreen extends StatefulWidget {
  static const String RouteName = "/student_detail_page";
  final Student student;
  const StudentDetailScreen(this.student, {Key? key}) : super(key: key);

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final content = [
      Expanded(
        flex: 5,
        child: Card(
          child: StudentView(widget.student),
        ),
      ),
      Expanded(
        flex: 7,
        child: StudentDetailsNavigation(widget.student),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Student ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(3),
        child: getDeviceType() == DeviceType.Desktop
            ? Row(children: content)
            : Column(
                children: content,
              ),
      ),
    );
  }
}
