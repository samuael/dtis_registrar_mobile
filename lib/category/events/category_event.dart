import 'package:image_picker/image_picker.dart';

import "../../libs.dart";
class CategoryEvent {}

// CategoriesLoad load all categories.
class CategoriesLoad extends CategoryEvent{}

class CategoryCreateWithImage extends CategoryEvent{
  final Category category;
  final XFile file;

  CategoryCreateWithImage(this.category , this.file );
}

// CategoryCreateWithOutImage
class CategoryCreateWithOutImage extends CategoryEvent{
  final Category category;
  CategoryCreateWithOutImage(this.category);
}