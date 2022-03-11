import "package:http/http.dart";
import "../../libs.dart";
import "dart:convert";

class RoundDataProvider {
  final Client client = Client();

  Future<RoundResponse> createRound(RoundInput roundinput) async {
    try {
      var response = await client.post(
        Uri(
          scheme: "http",
          host: StaticDataStore.HOST,
          port: StaticDataStore.PORT,
          path: "/api/admin/round/new/",
        ),
        body: jsonEncode(roundinput.toJson()),
        headers: {
          "Authorization": StaticDataStore.HEADERS["authorization"] ?? ""
        },
      );
      print(response.statusCode);
      print(STATUS_CODES[response.statusCode]!);
      if (response.statusCode == 200 ||
          response.statusCode == 404 ||
          response.statusCode == 400 ||
          response.statusCode == 409) {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        if (response.statusCode == 200) {
          return RoundResponse(
            response.statusCode,
            "${body["msg"]}",
            round: Round.fromJson(body["round"]),
          );
        }
        print("Round created succesfuly");
        return RoundResponse(response.statusCode, body["msg"]);
      } else {
        print("Round Not created");
        return RoundResponse(
            response.statusCode, STATUS_CODES[response.statusCode]!);
      }
    } catch (e) {
      print("Round Creation Error: ${e.toString()}");
      return RoundResponse(999, STATUS_CODES[999]!);
    }
  }

  Future<RoundResponse> updateRound(RoundUpdateModel update) async {
    try {
      var response = await client.put(
        Uri(
          scheme: "http",
          host: StaticDataStore.HOST,
          port: StaticDataStore.PORT,
          path: "/api/admin/round/",
        ),
        body: jsonEncode(update.toJson()),
        headers: {
          "Authorization": StaticDataStore.HEADERS["authorization"] ?? ""
        },
      );
      print(response.statusCode);
      print(response.body.toString());
      print(STATUS_CODES[response.statusCode]!);
      if (response.statusCode == 200 ||
          response.statusCode == 404 ||
          response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 409) {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        if (response.statusCode == 200) {
          print(body);
          return RoundResponse(
            response.statusCode,
            "${body["msg"]}",
            round: Round.fromJson(body["round"] as Map<String, dynamic>),
          );
        }
        return RoundResponse(response.statusCode, body["msg"]);
      } else if (response.statusCode == 304) {
        return RoundResponse(response.statusCode, "category not modified!");
      } else {
        return RoundResponse(
            response.statusCode, STATUS_CODES[response.statusCode]!);
      }
    } catch (e) {
      print("Round Updating Error: ${e.toString()}");
      return RoundResponse(999, STATUS_CODES[999]!);
    }
  }

  Future<RoundResponse> activateRound(int roundID) async {
    try {
      var response = await client.get(
        Uri(
          scheme: "http",
          host: StaticDataStore.HOST,
          port: StaticDataStore.PORT,
          path: "/api/round/activation",
          queryParameters: {
            "id": "$roundID",
          },
        ),
        headers: {
          "Authorization": StaticDataStore.HEADERS["authorization"] ?? ""
        },
      );
      if (response.statusCode == 200 ||
          response.statusCode == 409 ||
          response.statusCode == 404) {
        final body = jsonDecode(response.body.toString());
        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          return RoundResponse(response.statusCode, body["msg"]);
        } else {
          return RoundResponse(response.statusCode, body["err"]);
        }
      } else if (response.statusCode == 304) {
        return RoundResponse(response.statusCode, "round status not modified");
      } else {
        return RoundResponse(
            response.statusCode, "failed to activate a round");
      }
    } catch (e) {
      print(e.toString());
      return RoundResponse(999, STATUS_CODES[999]!);
    }
  }

  Future<RoundResponse> deactivateRound(int roundID) async {
    try {
      var response = await client.get(
        Uri(
          scheme: "http",
          host: StaticDataStore.HOST,
          port: StaticDataStore.PORT,
          path: "/api/round/deactivation",
          queryParameters: {
            "id": "$roundID",
          },
        ),
        headers: {
          "Authorization": StaticDataStore.HEADERS["authorization"] ?? ""
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200 ||
          response.statusCode == 409 ||
          response.statusCode == 404) {
        final body = jsonDecode(response.body.toString());
        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          return RoundResponse(response.statusCode, body["msg"]);
        } else {
          return RoundResponse(response.statusCode, body["err"]);
        }
      } else if (response.statusCode == 304) {
        return RoundResponse(response.statusCode, "round status not modified");
      } else {
        return RoundResponse(
            response.statusCode, "failed to deactivate the round");
      }
    } catch (e) {
      print(e.toString());
      return RoundResponse(999, STATUS_CODES[999]!);
    }
  }
}
