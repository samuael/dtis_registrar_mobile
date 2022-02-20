import '../../libs.dart';

// CategoriesBloc ... 
class CategoriesBloc extends Bloc<CategoryEvent, CategoryBlocState>{
  CategoriesBloc(CategoryInit initialState) : super(initialState);
  CategoryRepository repository = CategoryRepository();
  
  @override
  Stream<CategoryBlocState> mapEventToState(CategoryEvent event) async* {
    if( event is CategoryEvent ){
      final result = await this.repository.loadCategories();
      if ( result.categories== null){
        yield CategoriesLoadFailed( STATUS_CODES[result.status]! );
      }
      final state = CategoriesListSuccess(result.categories!);
      yield state;
    }
    // -----------------------------------------------------------------
  }

}