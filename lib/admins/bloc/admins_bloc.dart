import "../../libs.dart";


class AdminsListBloc extends Bloc<AdminsListEvent,AdminsListState>  {
  AdminsListBloc() : super(AdminsListInit());

  AdminsListRepo repo = AdminsListRepo();

  @override 
  Stream<AdminsListState> mapEventToState(AdminsListEvent event ) async* {
    if (event is AdminsListLoadEvent){
      final response = await this.repo.getAdminsOfSystem();
      if (response.statusCode== 200){
        yield AdminsListLoadSuccess(response.admins!);
      }
    }
  }
}