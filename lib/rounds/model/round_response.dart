import 'package:drivers_dev/rounds/model/round_model.dart';

class RoundResponse{
  int statusCode;
  Round? round;
  String msg;
  RoundResponse(this.statusCode , this.msg, {this.round});
}