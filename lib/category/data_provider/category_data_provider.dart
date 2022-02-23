import 'package:drivers_dev/category/model/fetch_models.dart';
import "package:http/http.dart";
import "../../libs.dart";
import "dart:convert";

class CategoryDataProvider {
  final Client client = Client();

  Future<LoadMessage> getCategories() async {
    try {
      var response = await client.get(
        Uri(
          scheme: "http",
          host: StaticDataStore.HOST,
          port: StaticDataStore.PORT,
          path: "/api/categories",
        ),
      );
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        //  lets cast each element of the 'body' to Map<String, dynamic > from dynamic
        final modified = body.map<Map<String, dynamic>>((e) {
          return (e as Map<String, dynamic>);
        }).toList();
        return LoadMessage(response.statusCode, modified);
      }
      return LoadMessage(response.statusCode, null);
    } catch (e, a) {
      print(e.toString());
      return LoadMessage(-1, null);
    }
  }

  Future<LoadResponseMap?> createCategoryWithoutImage(Category category) async {
    try {
      var response = await client.post(
        Uri(
            scheme: "http",
            host: StaticDataStore.HOST,
            port: StaticDataStore.PORT,
            path: "/api/admin/category/new/"),
        body: jsonEncode(category.toJson()),
        headers: {
          "Authorization": StaticDataStore.HEADERS["authorization"] ?? ""
        },
      );
      print(response.statusCode);
      print(response.body);

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      if (body["msg"] != null && body["category"] != null) {
        return LoadResponseMap(
            status: response.statusCode,
            data: body["category"],
            msg: body["msg"]);
      } else {
        return LoadResponseMap(
          status: 500,
          data: null,
          msg: "failed to create",
        );
      }
    } catch (e, a) {
      print(e);
      return LoadResponseMap(
        status: 500,
        data: null,
        msg: "Connection failed due to unreachable network",
      );
    }
  }


  // Future<SimpleMessage> addProfilePicture(XFile _image) async {
  //   final headers = {"Authorization", "Bearer ${StaticDataStore.TOKEN}"};
  //   // var stream = new http.ByteStream(DelegatingStream.typed(_image.openRead()));
  //   try {
  //     print("To Be Sent .... ");
  //     var stream = ByteStream(_image.openRead());
  //     var length = await _image.length();
  //     final Map<String, String> header = {
  //       "Authorization": "Bearer " + StaticDataStore.TOKEN
  //     };
  //     // var uri = Uri.parse("${HOST}api/user/img/");
  //     var request = MultipartRequest(
  //       "POST",
  //       Uri(
  //           host: StaticDataStore.HOST,
  //           scheme: "http",
  //           port: StaticDataStore.PORT,
  //           path: "/api/maid/profile/add/"),
  //     );

  //     var multipartFile =
  //         MultipartFile('image', stream, length, filename: "frmMoile.jpg");
  //     // add file to multipart
  //     request.files.add(multipartFile);
  //     request.headers.addAll(header);
  //     final response = await request.send();

  //     print(response.stream.toString());
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       final jsonBody = jsonDecode(await response.stream.bytesToString());
  //       print(jsonBody);
  //       if (jsonBody["msg"] != "") {
  //         return SimpleMessage(msg: jsonBody["msg"] as String, success: true);
  //       } else {
  //         return SimpleMessage(msg: "invalid response body", success: false);
  //       }
  //     }
  //     return SimpleMessage(msg: "", success: false);
  //   } catch (e) {
  //     print(e.toString());
  //     return SimpleMessage(msg: "server error ", success: false);
  //   }
  // }

}
