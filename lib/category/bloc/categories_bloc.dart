import '../../libs.dart';

// CategoriesBloc ... 
class CategoriesBloc extends Bloc<CategoryEvent, CategoryBlocState>{
  CategoriesBloc(CategoryInit initialState) : super(initialState);
  CategoryRepository repository = CategoryRepository();
  
  @override
  Stream<CategoryBlocState> mapEventToState(CategoryEvent event) async* {
    if( event is CategoriesLoad ){
      final result = await this.repository.loadCategories();
      if ( result.categories== null){
        yield CategoriesLoadFailed( STATUS_CODES[result.status]! );
        return;
      }
      final state = CategoriesListSuccess(result.categories!);
      yield state;
    }else if (event is CategoryCreateWithOutImage){
        final result = await this.repository.createCategoryWithoutImage(event.category);
        if (result.category != null ){
          if (this.state is CategoriesListSuccess){
            (this.state as CategoriesListSuccess).categories.add(result.category!);
          }
          final newState = this.state;
          yield CategoryInit();
          yield newState;
          return;
        }
        yield CategoryCreationFailed(code : result.status, message:result.error!);
    }else if (event is CategoryCreateWithImage){

    }
    // -----------------------------------------------------------------
  }



}