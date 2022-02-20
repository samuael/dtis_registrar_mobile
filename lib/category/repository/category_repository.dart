import 'package:drivers_dev/category/model/fetch_categories.dart';
import "../../libs.dart" show Category, CategoryDataProvider, LoadCategories;

class CategoryRepository{
  CategoryDataProvider provider = CategoryDataProvider();

  Future<LoadCategories> loadCategories() async {
    final loaded = await this.provider.getCategories();
    List<Category> categories =[];
    if (loaded.status != 200 && loaded.data != null){
      for (int a=0; a < loaded.data!.length; a++){
        Category category = Category.fromJson( loaded.data![a] );
        categories.add(category);
      }
      return LoadCategories(loaded.status , categories);
    }else {
      return LoadCategories(loaded.status, null);
    }
  }
}