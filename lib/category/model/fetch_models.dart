import "../../libs.dart";

class LoadMessage{
  int status;
  List<Map<String,dynamic>>? data;

  LoadMessage(
    this.status,
    this.data,
  );
}