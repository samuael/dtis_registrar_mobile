import 'dart:convert';

import "../../libs.dart";
import 'package:http/http.dart';

// import 'encoding/json';
class AuthProvider {
  static Client client = Client();

  AuthProvider();

  Future<List<Map<String, dynamic>>?> loadMaids(int offset) async {
    final headers = {"Authorization": "Bearer ${StaticDataStore.TOKEN}"};
    print("Loading clients ");
    try {
      var response = await client.get(
        Uri(
          scheme: "http",
          host: StaticDataStore.HOST,
          port: StaticDataStore.PORT,
          path: "/api/admins/",
        ),
        headers: headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body) as List<dynamic>;
        final map = body.map<Map<String, dynamic>>((elem) {
          return (elem as Map<String, dynamic>);
        }).toList();
        return map;
      } else {
        return null;
      }
    } catch (e, a) {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> searchMaids(
      String text, int offset) async {
    final headers = {"Authorization": "Bearer ${StaticDataStore.TOKEN}"};
    try {
      var response = await client.get(
        Uri.parse(StaticDataStore.URI +
            "api/search/maids/?offset=$offset&limit=3&q=$text"),
        headers: headers,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body) as List<dynamic>;
        final map = body.map<Map<String, dynamic>>((elem) {
          return (elem as Map<String, dynamic>);
        }).toList();
        return map;
      } else {
        return null;
      }
    } catch (e, a) {
      print(a);
      return null;
    }
  }

  Future<Admin?> loginAdmin(String email, String password) async {
    try {
      print("$email   $password");
      var response = await client.post(
        Uri(
          scheme: "http",
          host: StaticDataStore.HOST,
          port: StaticDataStore.PORT,
          path: "/api/admin/login/",
        ),
        body: jsonEncode(
          {
            "email": email,
            "password": password,
          },
        ),
        headers: {"Content-Type": "application/json"},
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body) as Map<String, dynamic>;
        print(response.body);
        if (body["success"] == true) {
          return Admin.fromJson(body["user"] as Map<String, dynamic>);
        }
        return null;
      } else {
        return null;
      }
    } catch (e, a) {
      print("Exception ${e.toString()}   ${a.toString()}");
      return null;
    }
  }
}
