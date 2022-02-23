import '../../libs.dart';

// CategoriesBloc ...
class CategoriesBloc extends Bloc<CategoryEvent, CategoryBlocState>
    implements Cubit<CategoryBlocState> {
  CategoriesBloc(CategoryInit initialState) : super(initialState);
  CategoryRepository repository = CategoryRepository();

  @override
  Stream<CategoryBlocState> mapEventToState(CategoryEvent event) async* {
    if (event is CategoriesLoadEvent) {
      final result = await this.repository.loadCategories();
      if (result.categories == null) {
        yield CategoriesLoadFailed(STATUS_CODES[result.status]!);
        return;
      }
      final state = CategoriesListSuccess(result.categories!);
      yield state;
    } else if (event is CreateCategoriesLoadSuccessEvent) {
      yield CategoryInit();
      // yield CategoriesListSuccess(event.categories);
    } else if (event is AddCategoryEvent) {
      final categoriesState = this.state;
      yield CategoryInit();
      (categoriesState as CategoriesListSuccess).categories.add(event.category);
      yield categoriesState;
    }
    // -----------------------------------------------------------------
  }

  Future<CategoryCreationMessage> createCategoryWithOutImage(
      CategoryCreateWithOutImageEvent event) async {
    final result =
        await this.repository.createCategoryWithoutImage(event.category);
    if (result.category != null) {
      if (this.state is CategoriesListSuccess) {
        // (this.state as CategoriesListSuccess).categories.add(result.category!);
        // final newState = (this.state as CategoriesListSuccess).categories;
        // this.mapEventToState(CreateCategoriesLoadSuccessEvent(newState));
        return CategoryCreationMessage(
          category : result.category,
            code: result.status,
            message: result.msg ?? "category creation was succesful");
      }
    }
    return CategoryCreationMessage(code: result.status, message: result.msg!);
  }
}
