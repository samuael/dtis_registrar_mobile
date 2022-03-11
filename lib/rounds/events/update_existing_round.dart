import "../../libs.dart";

class UpdateExistingRoundEvent extends CategoryEvent {
  final Round round;
  UpdateExistingRoundEvent(this.round);
}
