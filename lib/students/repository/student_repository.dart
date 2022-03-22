import "../../libs.dart";

class StudentRepository {
  StudentDataProvider provider = StudentDataProvider();  

  StudentRepository();

  Future<RoundStudentsResponse> getListOfRoundStudents( int roundID , int offset , int limit ) async {
    final result = await this.provider.getListOfRoundStudents(roundID, offset, limit);
    if (result.statusCode == 200){
      final students = (result.studentsAsMap??[]).map<Student>((e) => Student.fromJson(e as Map<String, dynamic>)).toList();
      result.setStudents(students);
      return result;
    }
    return result;
  }
  
  
  Future<StudentRegistrationResponse>  registerStudent(Student student) async {
    return await this.provider.registerStudent(student);
  } 
  
}