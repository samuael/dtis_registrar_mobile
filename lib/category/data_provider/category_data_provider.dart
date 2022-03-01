import 'dart:io';

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

  Future<ImageUploadResponse> uploadCategoryPicture(
      File _image, int categoryID) async {
    try {
      var stream = ByteStream(_image.openRead());
      var length = await _image.length();
      var request = MultipartRequest(
        "PUT",
        Uri(
            host: StaticDataStore.HOST,
            scheme: "http",
            port: StaticDataStore.PORT,
            path: "/api/admin/category/image",
            // queryParameters: {"id": categoryID},
            query: "id=$categoryID"),
      );
      request.headers.addAll(
          {"Authorization": StaticDataStore.HEADERS["authorization"] ?? ""});
      var multipartFile =
          MultipartFile('image', stream, length, filename: "frmMoile.jpg");
      request.files.add(multipartFile);
      // request.fields.addAll({"id": categoryID});
      final response = await request.send();

      print(response.stream.toString());
      final jsonBody = jsonDecode(await response.stream.bytesToString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (jsonBody["msg"] != "") {
          return ImageUploadResponse(categoryID, jsonBody["msg"],
              msg: STATUS_CODES[response.statusCode]);
        } else {
          return ImageUploadResponse(categoryID, "",
              msg: STATUS_CODES[response.statusCode]);
        }
      }
      if (jsonBody["err"] == "") {
        return ImageUploadResponse(categoryID, "",
            msg: STATUS_CODES[response.statusCode]);
      }
      return ImageUploadResponse(categoryID, "", msg: jsonBody["err"]);
    } catch (e) {
      print(e.toString());
      return ImageUploadResponse(categoryID, "",
          msg: "error while uploading an Imange");
    }
  }
}
