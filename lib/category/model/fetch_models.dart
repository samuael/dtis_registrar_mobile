import "../../libs.dart";

class LoadMessage {
  int status;
  List<Map<String, dynamic>>? data;

  LoadMessage(
    this.status,
    this.data,
  );
}

class LoadResponseMap {
  int status;
  String error;
  Map<String, dynamic>? data;

  LoadResponseMap(
      {required this.status, required this.data, required this.error});
}
