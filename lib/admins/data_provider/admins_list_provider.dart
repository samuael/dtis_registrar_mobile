import "../../libs.dart";
import "package:http/http.dart";
import "dart:convert";

class AdminListProvider {
  Client client = Client();

  Future<AdminsListResponse> getAdminsOfSystem() async {
    // try {
      var response = await client.get(
        Uri(
          scheme: "http",
          host: StaticDataStore.HOST,
          port: StaticDataStore.PORT,
          path: "/api/admins",
        ),
        headers: {
              "Authorization": StaticDataStore.HEADERS["authorization"] ?? ""
        },
      );
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final modified = body.map<Map<String, dynamic>>((e) {
          return (e as Map<String, dynamic>);
        }).toList();
        print(" \n\n\n\n\n\n\n ADMINS \n\n\n\n");
        print(modified);
        print("\n\n\n\n\n\n");
        return AdminsListResponse(response.statusCode, STATUS_CODES[response.statusCode]! , modified);
      }
      return AdminsListResponse(response.statusCode, STATUS_CODES[response.statusCode]!,  []);
    // } catch (e, a) {
    //   print(e.toString());
    //   return AdminsListResponse(999, STATUS_CODES[999]!, []);
    // }
  }
}