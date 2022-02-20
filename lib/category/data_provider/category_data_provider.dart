import 'package:drivers_dev/category/model/fetch_models.dart';
import "package:http/http.dart";
import "../../libs.dart";
import "dart:convert";

class CategoryDataProvider{
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
        var body = jsonDecode(response.body);
        return LoadMessage(response.statusCode , body);
      }
      return LoadMessage(response.statusCode, null);
    } catch (e, a) {
      print(e.toString());
      return LoadMessage(-1 , null);
    }
  }


}