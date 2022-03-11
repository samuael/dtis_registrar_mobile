import 'dart:io';

import '../../libs.dart';

// CategoriesBloc ...
class CategoriesBloc extends Bloc<CategoryEvent, CategoryBlocState>
    implements Cubit<CategoryBlocState> {
  CategoriesBloc(CategoryInit initialState) : super(initialState);
  CategoryRepository repository = CategoryRepository();
  RoundRepository roundRepository = RoundRepository(RoundDataProvider());

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
    } else if (event is UploadCategoryProfilEvent) {
      final categoriesState = this.state;
      yield CategoryInit();
      for (int a = 0;
          a < (categoriesState as CategoriesListSuccess).categories.length;
          a++) {
        if (event.categoryid == (categoriesState).categories[a].id) {
          (categoriesState).categories[a].imgurl = event.imgurl;
        }
      }
      yield categoriesState;
    } else if (event is CategoryStudentsQuantityEvent) {
      if (!(this.state is CategoriesListSuccess)) {
        return;
      }
      final result =
          await this.repository.loadCategoryStudentsQuantity(event.categoryID);
      final tempostate = this.state;
      yield (CategoryInit());
      for (Category ca in (tempostate as CategoriesListSuccess).categories) {
        if (ca.id == result.categoryid) {
          ca.activeStudentsQuantity = result.activeStudents;
          ca.studentsQuantity = result.allStudents;
        }
      }
      yield tempostate;
    } else if (event is LoadRoundsOfACategoryEvent) {
      if (!(this.state is CategoriesListSuccess)) {
        return;
      }
      final rounds =
          await this.repository.loadCategoriesOfRound(event.categoryID);
      if (rounds.length > 0) {
        final states = this.state;
        yield (CategoryInit());
        for (Category cat in (states as CategoriesListSuccess).categories) {
          if (cat.id == event.categoryID) {
            cat.rounds = rounds;
          }
        }
        yield (states);
      }
    } else if (event is CategoryUpdateEvent) {
      if (!(this.state is CategoriesListSuccess)) {
        return;
      }
      final thestate = this.state;
      yield thestate;
      for (Category cat in (thestate as CategoriesListSuccess).categories) {
        if (cat.id == event.category.id) {
          cat.title = event.category.title;
          cat.shortTitle = event.category.shortTitle;
          cat.fee = event.category.fee;
          cat.imgurl = event.category.imgurl;
          cat.numberOfRounds = event.category.numberOfRounds;
        }
      }
      yield thestate;
    } else if (event is AddNewRoundEvent) {
      if (!(this.state is CategoriesListSuccess)) {
        return;
      }
      final thestate = this.state;
      for (Category cat in (thestate as CategoriesListSuccess).categories) {
        if (cat.id == (event as AddNewRoundEvent).round.categoryID) {
          cat.rounds = cat.rounds ?? [];
          cat.rounds!.add((event as AddNewRoundEvent).round);
        }
      }
      yield thestate;
    } else if (event is UpdateExistingRoundEvent) {
      if (!(this.state is CategoriesListSuccess)) {
        return;
      }
      final thestate = this.state;
      yield CategoryInit();
      for (Category cat in (thestate as CategoriesListSuccess).categories) {
        if (cat.id == event.round.categoryID) {
          for (Round rnd in cat.rounds ?? []) {
            if (rnd.id == event.round.id) {
              rnd.trainingHours = event.round.trainingHours;
              rnd.roundNumber = event.round.roundNumber;
              rnd.students = event.round.students;
              rnd.activeAmount = event.round.activeAmount;
              rnd.active = event.round.active;
              rnd.startDate = event.round.startDate;
              rnd.endDate = event.round.endDate;
              rnd.lang = event.round.lang;
              rnd.fee = event.round.fee;
            }
          }
        }
      }
      yield thestate;
    }
  }

  Future<ImageUploadResponse> uploadCategoryPicture(
      File image, int categoryid) async {
    return this.repository.uploadCategoryPicture(image, categoryid);
  }

  Future<CategoryCreationMessage> createCategoryWithOutImage(
      CategoryCreateWithOutImageEvent event) async {
    final result =
        await this.repository.createCategoryWithoutImage(event.category);
    if (result.category != null) {
      if (this.state is CategoriesListSuccess) {
        return CategoryCreationMessage(
            category: result.category,
            code: result.status,
            message: result.msg ?? "category creation was succesful");
      }
    }
    return CategoryCreationMessage(code: result.status, message: result.msg!);
  }

  Future<CategoryUpdateResponse> updateCategory(Category category) async {
    return await this.repository.updateCategory(category);
  }

  Future<CategoryUpdateResponse> updateCategoryFee(
      int categoryID, double amount) async {
    return await this.repository.updateCategoryFee(categoryID, amount);
  }
}
