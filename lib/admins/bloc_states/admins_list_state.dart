import "../../libs.dart";

class AdminsListState {}

class AdminsListInit extends AdminsListState {}

class AdminsListLoadSuccess extends AdminsListState {
  List<Admin> admins;
  AdminsListLoadSuccess(this.admins);

  Admin? getAdminByID(int id){
    for(Admin admin in this.admins){
      if (admin.id == id){
        return admin;
      }
    }
    return null;
  }
}

class AdminsListLoadFailed extends AdminsListState {
  String reason;
  int statusCode;
  AdminsListLoadFailed(this.reason, this.statusCode);
}

class AdminsListLoading extends AdminsListState {}
