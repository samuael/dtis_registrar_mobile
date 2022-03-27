import "../../libs.dart";

class AdminsListEvent {}

class AdminsListLoadEvent extends AdminsListEvent {
  Date? date;
  AdminsListLoadEvent({this.date});
}

class AdminsListUpdateEvent extends AdminsListEvent {
  List<Admin> admins;
  AdminsListUpdateEvent(this.admins);
}