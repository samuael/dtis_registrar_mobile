import "../../libs.dart";

class StudentPaymentsRepo {
  StudentPaymentsProvider provider = StudentPaymentsProvider();

  Future<StudentPaymentsResponse> getPaymentsOfStudent(int studentID) async {
    final response = await this.provider.getPaymentsOfStudent(studentID);
    if (response.statusCode == 200) {
      final payments = response.paymentsAsMap.map<PayIn>((e) {
        return PayIn.fromJson(e);
      }).toList();
      response.setPayments(payments);
      return response;
    } else if (response.statusCode == 404) {
      response.setPayments([]);
    }
    return response;
  }
}
