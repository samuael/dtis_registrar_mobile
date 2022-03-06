import 'dart:io';

import 'package:image_picker/image_picker.dart';

import "../../libs.dart";
class CategoryEvent {}

// CategoriesLoad load all categories.
class CategoriesLoadEvent extends CategoryEvent{}

class CategoryCreateWithImageEvent extends CategoryEvent{
  final Category category;
  final XFile file;

  CategoryCreateWithImageEvent(this.category , this.file );
}

// CategoryCreateWithOutImage
class CategoryCreateWithOutImageEvent extends CategoryEvent{
  final Category category;
  CategoryCreateWithOutImageEvent(this.category);
}

class CreateCategoriesLoadSuccessEvent extends CategoryEvent{
  final List<Category> categories;

  CreateCategoriesLoadSuccessEvent(this.categories);
}

class AddCategoryEvent extends CategoryEvent {
  Category category;
  AddCategoryEvent(this.category);
}

class UploadCategoryProfilEvent extends CategoryEvent {
  String imgurl;
  int categoryid;
  UploadCategoryProfilEvent(this.imgurl , this.categoryid);
}

class LoadRoundsOfACategoryEvent extends CategoryEvent {
  int categoryID;
  LoadRoundsOfACategoryEvent(this.categoryID); 
}

class CategoryStudentsQuantityEvent extends CategoryEvent {
    int categoryID;
    CategoryStudentsQuantityEvent(this.categoryID);
}