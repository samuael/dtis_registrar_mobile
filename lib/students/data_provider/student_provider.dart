import "package:http/http.dart";
import "../../libs.dart";
import "dart:convert";

class StudentDataProvider {
  Client client = Client();

  Future<RoundStudentsResponse> getListOfRoundStudents(
      int roundID, int offset, int limit) async {
    try {
      var response = await client.get(
        Uri(
          scheme: "http",
          host: StaticDataStore.HOST,
          port: StaticDataStore.PORT,
          path: "/api/round/students",
          queryParameters: {
            "round_id": "$roundID",
            "offset": "$offset",
            "limit": "$limit",
          },
        ),
        headers: {
          "Authorization": StaticDataStore.HEADERS["authorization"] ?? ""
        },
      );
      print(
          " Students of  Round with id : $roundID is called and \nResponse : ${response.statusCode}");
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        return RoundStudentsResponse(
          roundid: roundID,
          statusCode: response.statusCode,
          msg: "students of round has been fetched succesfuly",
          studentsAsMap: body["students"]
              .map<Map<String, dynamic>>((e) => e as Map<String, dynamic>)
              .toList() as List<Map<String, dynamic>>,
        );
      } else if (response.statusCode == 400 ||
          response.statusCode == 500 ||
          response.statusCode == 404) {
        final body = jsonDecode(response.body);
        return RoundStudentsResponse(
          roundid: roundID,
          statusCode: body["status_code"] as int,
          msg: "${body["msg"]}",
        );
      } else {
        return RoundStudentsResponse(
          roundid: roundID,
          statusCode: 999,
          msg: STATUS_CODES[response.statusCode]!,
        );
      }
    } catch (e) {
      print(e.toString());
      return RoundStudentsResponse(
        roundid: roundID,
        statusCode: 999,
        msg: STATUS_CODES[999]!,
      );
    }
  }

  Future<StudentRegistrationResponse> registerStudent(Student student) async {
    try {
      final response = await this.client.post(
            Uri(
              scheme: "http",
              host: StaticDataStore.HOST,
              port: StaticDataStore.PORT,
              path: "/api/student/new/",
            ),
            headers: {
              "Authorization": StaticDataStore.HEADERS["authorization"] ?? ""
            },
            body: jsonEncode(student.toJson()),
          );
      print(response.body);
      if (response.statusCode == 400 ||
          response.statusCode == 409 ||
          response.statusCode == 500 ||
          response.statusCode == 200) {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        if (response.statusCode == 200) {
          final resp = StudentRegistrationResponse(
            msg: STATUS_CODES[response.statusCode]!,
            errors: {},
            statusCode: response.statusCode,
            student: Student.fromJson(body),
          );
          return resp;
        } else {
          final rsp = StudentRegistrationResponse(
            errors: body["errs"] as Map<String, dynamic>,
            msg: "${body["msg"] ?? ''}",
            statusCode: response.statusCode,
          );
          return rsp;
        }
      } else {
        return StudentRegistrationResponse(
          statusCode: response.statusCode,
          msg: STATUS_CODES[response.statusCode]!,
          errors: {},
        );
      }
    } catch (e) {
      print(e.toString());
      return StudentRegistrationResponse(
        errors: {},
        msg: STATUS_CODES[999]!,
        statusCode: 999,
      );
    }
  }
}
