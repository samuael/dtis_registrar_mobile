import "../../libs.dart";

class RoundStudentsResponse {
  int roundid;
  String msg;
  List<Map<String, dynamic>?>? studentsAsMap;
  List<Student>? students;
  int statusCode;

  RoundStudentsResponse(
      {required this.roundid,
      required this.statusCode,
      required this.msg,
      this.studentsAsMap});

  setStudents(List<Student> students) {
    this.students = students;
  }
  
}
