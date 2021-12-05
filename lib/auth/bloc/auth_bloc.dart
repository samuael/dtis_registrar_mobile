import '../../libs.dart';

class AuthBloc extends Bloc<AuthEvent, AuthBlocState> {
  AuthBloc({required this.repo}) : super(AuthStateInit());
  final AuthRepo repo;

  @override
  Stream<AuthBlocState> mapEventToState(AuthEvent event) async* {
    if (event is AuthLoginEvent) {
      print("Login Called ......");
      final thestate = await repo.loginAdmin(event.email, event.password);
      yield (AuthStateInit());
      if (thestate != null) {
        print(
            "Succesfuly Logged In with the email ${event.email} and password ${event.password}");
        yield (AuthAdminLoggedIn(thestate));
        return;
      }
      yield AuthAdminLoginNotSuccesful();
    }
  }
}
