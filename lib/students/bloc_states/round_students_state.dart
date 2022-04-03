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

  Student getStudent(int roundID , int studentID) {
    for (Student stu in this.roundStudents[roundID]! ){
      if (stu.id == studentID){
        return stu;
      }
    }
    return Student(
      id :  0,
      fullname : "Unknown --" ,
      sex :  "U",
      age :  18,
      birthDate : Date(),
      accademicStatus   : "Unknown" ,
      address :  Address(
        id : 5,
        city : "Unknown",
        region :"Unknown" ,
        zone : "--",
        woreda : "--",
        kebele : "--",
      ),
      phone :  "+2519--------",
      paidAmount :  0.0,
      status :  0,
      registeredBy : 0 ,
      roundID :  0,
      imgurl :  '',
      marked :  null,
      registeredAt  :null,
    );
  }
}

class RoundStudentsLoading extends RoundStudentsState {}

class RoundStudentsLoadingFailed extends RoundStudentsState {}

// class RoundStudentsLoad