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
}
