

class StudentPaymentsEvent {}

class StudentPaymentsLoad extends StudentPaymentsEvent{
  int studentID;

  StudentPaymentsLoad(this.studentID);
}

class StudentPaymentsRemove extends StudentPaymentsEvent {
  int studentID;

  StudentPaymentsRemove(this.studentID);
}