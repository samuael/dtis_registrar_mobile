import "../../libs.dart";

class CategoryBlocState {}

// CategoryInit ... 
class CategoryInit extends CategoryBlocState{}
// CategoriesListSuccess ... 
class CategoriesListSuccess extends CategoryBlocState{
  List<Category> categories ;
  CategoriesListSuccess(this.categories); 
}

// CategoriesLoadFailed
class CategoriesLoadFailed extends CategoryBlocState{
  String reason;
  CategoriesLoadFailed(this.reason);
}

class CategoryCreationFailed extends CategoryBlocState{
  int code;
  String message;
  CategoryCreationFailed({required this.code ,required this.message});
}