import 'dart:io';

import "../../libs.dart"
    show
        Category,
        CategoryDataProvider,
        ImageUploadResponse,
        LoadCategories,
        LoadCategory,
        Round,
        CategoryStudentsQuantity,
        CategoryUpdateResponse
        ;

class CategoryRepository {
  CategoryDataProvider provider = CategoryDataProvider();

  Future<LoadCategories> loadCategories() async {
    final loaded = await this.provider.getCategories();
    List<Category> categories = [];
    if (loaded.status == 200 && loaded.data != null) {
      for (int a = 0; a < loaded.data!.length; a++) {
        Category category = Category.fromJson(loaded.data![a]);
        categories.add(category);
      }
      return LoadCategories(loaded.status, categories);
    } else {
      return LoadCategories(loaded.status, null);
    }
  }

  Future<LoadCategory> createCategoryWithoutImage(Category category) async {
    final loadResponse =
        await this.provider.createCategoryWithoutImage(category);
    if ((loadResponse!.status == 201 || loadResponse!.status == 200) &&
        loadResponse!.data != null) {
      final category = Category.fromJson(loadResponse!.data!);
      return LoadCategory(
          status: loadResponse.status,
          category: category,
          msg: loadResponse.msg);
    } else if (loadResponse!.data != null) {
      return LoadCategory(
          status: loadResponse!.status, category: null, msg: loadResponse.msg);
    }
    return LoadCategory(
        status: loadResponse.status, category: null, msg: loadResponse.msg);
  }

  // uploadCategoryPicture ...
  Future<ImageUploadResponse> uploadCategoryPicture(
      File file, int categoryid) async {
    return this.provider.uploadCategoryPicture(file, categoryid);
  }

  Future<List<Round>> loadCategoriesOfRound(int categoryid) async {
    final listofroundmaps =
        ((await this.provider.loadCategoriesOfRound(categoryid)) ?? []);
    for (int a = 0; a < listofroundmaps.length; a++) {
      if (listofroundmaps[a] == null) {
        listofroundmaps.removeAt(a);
      }
    }
    (listofroundmaps as List<Map<String, dynamic>?>).removeWhere( (e){ return (e==null);});
    final maps = listofroundmaps.map<Map<String, dynamic>>((e){  return (e as Map<String, dynamic>); }).toList();
    final listofRounds =
        Round.fromJsonList(maps);
    return listofRounds;
  }

  Future<CategoryStudentsQuantity> loadCategoryStudentsQuantity(
      int categoryID) async {
    return await this.provider.loadCategoryStudentsQuantity(categoryID);
  }


  Future<CategoryUpdateResponse> updateCategory(Category category ) async {
    return await this.provider.updateCategory(category);
  }

  Future<CategoryUpdateResponse>  updateCategoryFee(int categoryID, double amount) async {
    return await this.provider.updateCategoryFee(categoryID, amount);
  }
}
