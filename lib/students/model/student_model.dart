import "../../libs.dart";

class Student {
  int? id;
  String fullname;
  String sex;
  int? age;
  Date birthDate;
  String accademicStatus;
  Address address;
  String phone;
  double paidAmount;
  int status;
  int? registeredBy;
  int roundID;
  String imgurl;
  SpecialCase? marked;
  Date? registeredAt;

  Student({
    this.id,
    required this.fullname,
    required this.sex,
    required this.age,
    required this.birthDate,
    required this.accademicStatus,
    required this.address,
    required this.phone,
    required this.paidAmount,
    required this.status,
    this.registeredBy,
    required this.roundID,
    required this.imgurl,
    this.marked,
    this.registeredAt,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: int.parse("${json["id"] ?? 0}"),
      fullname: "${json["fullname"]}",
      sex: "${json["sex"]}",
      age: int.parse("${json["age"] ?? 0}"),
      birthDate: Date.fromJson(json["birth_date"] as Map<String, dynamic>),
      accademicStatus: "${json["acc_status"]}",
      address: Address.fromJson(json["address"] as Map<String, dynamic>),
      phone: "${json["phone"]}",
      paidAmount: double.parse("${json["paid_amount"] ?? 0}"),
      status: int.parse("${json["status"] ?? 0}"),
      registeredBy: int.parse("${json["registered_by"] ?? 0}"),
      roundID: int.parse("${json["round_id"] ?? 0}"),
      imgurl: "${json["imgurl"]}",
      marked:
          SpecialCase.fromJson(json["special_case"] as Map<String, dynamic>),
      registeredAt:
          Date.fromJson(json["registered_at"] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "fullname": this.fullname,
      "sex": this.sex,
      "age": this.age,
      "birth_date": this.birthDate,
      "acc_status": this.accademicStatus,
      "address": this.address,
      "phone": this.phone,
      "paid_amount": this.paidAmount,
      "status": this.status,
      "registered_by": this.registeredBy,
      "round_id": this.roundID,
      "imgurl": this.imgurl,
      "special_case": this.marked,
      "registered_at": this.registeredBy,
    };
  }
}
