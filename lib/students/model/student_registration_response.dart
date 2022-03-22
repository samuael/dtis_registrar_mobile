import "../../libs.dart";

class StudentRegistrationResponse {
  Map<String, dynamic> errors;
  int statusCode;
  String msg;
  Student? student;

  StudentRegistrationResponse({
    required this.errors,
    required this.statusCode,
    required this.msg,
    this.student,
  });
}
