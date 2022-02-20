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
      print("${response.statusCode} ");
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        //  lets cast each element of the 'body' to Map<String, dynamic > from dynamic
        final modified = body.map<Map<String , dynamic>>((e) { return (e as Map<String , dynamic>);} ).toList();
        return LoadMessage(response.statusCode , modified);
      }
      return LoadMessage(response.statusCode, null);
    } catch (e, a) {
      print(e.toString());
      return LoadMessage(-1 , null);
    }
  }


  Future<LoadResponseMap?> createCategoryWithoutImage( Category category ) async {
    try{
      final header = { "Authorization" : "Bearer ${StaticDataStore.TOKEN}" ,};

      var response = await client.post(
        Uri(
          scheme: "http",
            host: StaticDataStore.HOST,
            port: StaticDataStore.PORT,
            path: "/api/admin/category/new/"
      ),
      body: jsonEncode(
        category.toJson()
      ),
      headers: header,
      );
      print(response.statusCode );
      if (response.statusCode == 201){
        final body = jsonEncode(response.body) as Map<String, dynamic>;
        return LoadResponseMap(status: response.statusCode , data:body , error :"");
      }
      return LoadResponseMap(status: response.statusCode , data: null ,error:"" );
    }catch(e , a){
      return  LoadResponseMap(status: 500 , data : null , error:"" , );
    }
  }
}