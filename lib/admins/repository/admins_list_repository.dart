import "../../libs.dart";

class AdminsListRepo {
  AdminListProvider provider = AdminListProvider();

  Future<AdminsListResponse>  getAdminsOfSystem()  async {
    final response = await this.provider.getAdminsOfSystem();
    print(response.msg);
    if (response.statusCode == 200 ){
      final admins = response.adminsAsMap.map<Admin>((map){
        return Admin.fromJson(map);
      }).toList();
      print("\n\n\nThe admins Found are ${admins.length}\n\n\n");
      response.setAdmins(admins);
      return response;
    }
    return response;
  }
}