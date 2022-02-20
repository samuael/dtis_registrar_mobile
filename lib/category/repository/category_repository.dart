import 'package:drivers_dev/category/model/fetch_categories.dart';
import "../../libs.dart" show Category, CategoryDataProvider, LoadCategories;

class CategoryRepository{
  CategoryDataProvider provider = CategoryDataProvider();

  Future<LoadCategories> loadCategories() async {
    final loaded = await this.provider.getCategories();
    List<Category> categories =[];
    if (loaded.status == 200 && loaded.data != null){
      for (int a=0; a < loaded.data!.length; a++){
        Category category = Category.fromJson( loaded.data![a] );
        categories.add(category);
      }
      return LoadCategories(loaded.status , categories);
    }else {
      return LoadCategories(loaded.status, null);
    }
  }


  Future<LoadCategory> createCategoryWithoutImage(Category category) async {
    final loadResponse = await this.provider.createCategoryWithoutImage(category);
    if (loadResponse!.status ==201 && loadResponse!.data != null){
      final category = Category.fromJson(loadResponse!.data!);
      if( category != null){
        return LoadCategory(status: loadResponse.status , category : category, error: loadResponse.error);
      }else {
        return LoadCategory(status:500 , category:null , error:loadResponse.error);
      }
    }
    return LoadCategory(status: loadResponse.status,category: null, error: loadResponse.error);
  }
}