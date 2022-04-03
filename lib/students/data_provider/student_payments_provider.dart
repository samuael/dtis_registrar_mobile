import "../../libs.dart";
import "package:http/http.dart";
import "dart:convert";

class StudentPaymentsProvider {
  Client client = Client();

  Future<StudentPaymentsResponse> getPaymentsOfStudent(int studentID) async {
    try {
      var response = await client.get(
        Uri(
          scheme: "http",
          host: StaticDataStore.HOST,
          port: StaticDataStore.PORT,
          path: "/api/student/payments",
          queryParameters: {
            "student_id": "$studentID",
          },
        ),
        headers: {
          "Authorization": StaticDataStore.HEADERS["authorization"] ?? ""
        },
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body).map<Map<String, dynamic>>((el) {
          return (el as Map<String, dynamic>);
        }).toList();
        return StudentPaymentsResponse(response.statusCode,
            "payments are succesfuly loaded", studentID, body);
      } else if (response.statusCode == 404 || response.statusCode == 400) {
        final body = jsonDecode(response.body);
        return StudentPaymentsResponse(
            response.statusCode, body["msg"], studentID, []);
      }
      return StudentPaymentsResponse(999, STATUS_CODES[999]!, studentID, []);
    } catch (e, a) {
      print(e.toString());
      return StudentPaymentsResponse(999, STATUS_CODES[999]!, studentID, []);
    }
  }

  Future<StudentPaymentResponse> createPayment(PayInInput payin) async {
    try {
      print(" ----------------- Endegena Creating Statement --------------------------- ");
      final response = await client.post(
        Uri(
          scheme: "http",
          host: StaticDataStore.HOST,
          port: StaticDataStore.PORT,
          path: "/api/payment/new",
        ),
        body: jsonEncode(payin.toJson()),
        headers: {
          "Authorization": StaticDataStore.HEADERS["authorization"] ?? ""
        },
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 201) {
        final body = jsonDecode(response.body);
        return StudentPaymentResponse(
            response.statusCode, payin.studentID, body["msg"] as String,
            payment: PayIn.fromJson(body["payment"] as Map<String, dynamic>));
      } else if (response.statusCode == 404 ||
          response.statusCode == 400 ||
          response.statusCode == 500 ||
          response.statusCode == 409) {
        // --------------------------
        final body = jsonDecode(response.body);
        return StudentPaymentResponse(
            response.statusCode, payin.studentID, body["msg"]);
      } else {
        return StudentPaymentResponse(
            response.statusCode, payin.studentID, STATUS_CODES[999]!);
      }
    } catch (e, a) {
      print(e.toString());
      return StudentPaymentResponse(999, payin.studentID, STATUS_CODES[999]!);
    }
  }
}
