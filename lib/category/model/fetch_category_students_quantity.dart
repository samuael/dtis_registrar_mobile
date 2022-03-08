import "../../libs.dart"  show Category;
class CategoryStudentsQuantity {
  int categoryid;
  int activeStudents;
  int allStudents;

  CategoryStudentsQuantity(
      {required this.activeStudents,
      required this.allStudents,
      required this.categoryid});

  factory CategoryStudentsQuantity.fromJson(
      Map<String, dynamic>? json, int categoryID) {
    if (json == null) {
      return CategoryStudentsQuantity(
          categoryid: categoryID, activeStudents: -1, allStudents: -1);
    }
    return CategoryStudentsQuantity(
      categoryid: int.parse("${json['category_id']}"),
      allStudents: int.parse("${json['students_count']}"),
      activeStudents: int.parse("${json['active_students']}"),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "category_id": this.categoryid,
      "students_count": this.allStudents,
      "active_students": this.activeStudents,
    };
  }
}
// ----------------------------------------------
class CategoryUpdateResponse{
  int status;
  String msg;
  Category?  category;

  CategoryUpdateResponse(this.status , this.msg , {this.category});
}