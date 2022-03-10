import "../../libs.dart";

class UpdateExistingCategoryEvent extends CategoryEvent {
  final Round round;
  UpdateExistingCategoryEvent(this.round);
}
