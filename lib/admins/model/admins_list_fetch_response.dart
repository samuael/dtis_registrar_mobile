import "../../libs.dart";

class AdminsListResponse {
  final int statusCode;
  final String msg;
  final List<Map<String , dynamic>> adminsAsMap;
  List<Admin>?  admins;

  AdminsListResponse(this.statusCode , this.msg , this.adminsAsMap );

  void setAdmins(List<Admin> admins) {
    this.admins = admins;
  }
}