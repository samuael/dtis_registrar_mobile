import '../../libs.dart';

class Admin {
  int id;
  String fullname;
  String email;
  String password;
  bool superadmin;
  String imgurl;

  Admin({
    required this.id,
    required this.fullname,
    required this.email,
    required this.password,
    required this.superadmin,
    required this.imgurl,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      id: int.parse("${json['id']}"),
      fullname: json["fullname"],
      email: json["email"],
      password: json["password"],
      superadmin: json["superadmin"],
      imgurl: json["imgurl"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "fullname": this.fullname,
      "email": this.email,
      "password": this.password, //
      "superadmin": this.superadmin,
      "imgurl": this.imgurl,
    };
  }
}
