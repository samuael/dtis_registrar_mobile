class RoundStudentsEvent {}

class RoundStudentsLoadEvent extends RoundStudentsEvent {
  int roundID;
  RoundStudentsLoadEvent(this.roundID);
}

class MultipleRoundsStudentsLoadEvent extends RoundStudentsEvent {
  List<int> roundIDS;
  MultipleRoundsStudentsLoadEvent(this.roundIDS);
}