import '../../libs.dart';
class LoadCategories{
  int status;
  List<Category>? categories;

  LoadCategories(this.status,this.categories );
}



class LoadCategory{
  int status;
  Category? category;
  String? msg ;

  LoadCategory({required this.status , this.category , this.msg=""});
}