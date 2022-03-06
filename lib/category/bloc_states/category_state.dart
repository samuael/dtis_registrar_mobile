import "../../libs.dart";

class CategoryBlocState {}

// CategoryInit ...
class CategoryInit extends CategoryBlocState {}

// CategoriesListSuccess ...
class CategoriesListSuccess extends CategoryBlocState {
  List<Category> categories;
  CategoriesListSuccess(this.categories);


  Category? getCategoryByID(int id ){
    for(Category c in this.categories){
      if (c.id == id ){
        return c;
      }
    }
    return null;
  }
}

// CategoriesLoadFailed
class CategoriesLoadFailed extends CategoryBlocState {
  String reason;
  CategoriesLoadFailed(this.reason);
}

class CategoryCreationMessage extends CategoryBlocState {
  Category? category;
  int code;
  String message;
  CategoryCreationMessage(
      {this.category, required this.code, required this.message});
}
