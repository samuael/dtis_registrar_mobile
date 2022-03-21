import '../../libs.dart';

class RoundStudentsState {}

class RoundStudentsInit extends RoundStudentsState {}

class RoundStudentsLoaded extends RoundStudentsState {
  // a map of round id to a list of students.
  Map<int, List<Student>> roundStudents;
  RoundStudentsLoaded({required this.roundStudents});

  addStudents(int roundID, List<Student> students) {
    List<int> keys = this.roundStudents.keys.toList();
    if (this.roundStudents[roundID] == null) {
      this.roundStudents[roundID] = students;
    } else {
      this.roundStudents[roundID]!.addAll(students);
    }
  }


  addSingleStudent(int roundID , Student  student)  {
    List<int> keys = this.roundStudents.keys.toList();
    if (this.roundStudents[roundID] == null) {
      this.roundStudents[roundID] = [student];
    } else {
      this.roundStudents[roundID]!.add(student);
    }
  }
}

class RoundStudentsLoading extends RoundStudentsState {}

class RoundStudentsLoadingFailed extends RoundStudentsState {}

// class RoundStudentsLoad