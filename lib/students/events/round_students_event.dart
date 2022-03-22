import "../../libs.dart";

class RoundStudentsEvent {}

class RoundStudentsLoadEvent extends RoundStudentsEvent {
  int roundID;
  RoundStudentsLoadEvent(this.roundID);
}

class MultipleRoundsStudentsLoadEvent extends RoundStudentsEvent {
  List<int> roundIDS;
  MultipleRoundsStudentsLoadEvent(this.roundIDS);
}

class StudentRegisteredEvent extends RoundStudentsEvent {
  Student student;
  int roundID;
  StudentRegisteredEvent(this.student, this.roundID);
}
