import 'package:drivers_dev/category/events/category_event.dart';

import "../../libs.dart" show Round;

class RoundEvents{}

class AddNewRoundEvent extends  CategoryEvent{
  Round round;
  AddNewRoundEvent(this.round);
}
