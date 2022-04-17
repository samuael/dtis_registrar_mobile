import "../../libs.dart";

class StudentRegistrationFullScreen extends StatelessWidget {
  static const String RouteName = "/student/registration/screen";
  final int roundID;
  final Student? student;
  StudentRegistrationFullScreen(this.roundID , { this.student,  Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        centerTitle:  true,
        title : Text("Student Registration",),
      ),
      // body: StudentRegistrationScreen(roundID:this.roundID , student: this.student),
    );
  }
}