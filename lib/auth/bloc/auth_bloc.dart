import '../../libs.dart';

class AuthBloc extends Bloc<AuthEvent, AuthBlocState>
    implements Cubit<AuthBlocState> {
  AuthBloc({required this.repo}) : super(AuthStateInit());
  final AuthRepo repo;

  @override
  Stream<AuthBlocState> mapEventToState(AuthEvent event) async* {
    if (event is AdminLoginInProgressEvent) {
      yield (AuthAdminLoginOnProgress());
    } else if (event is AuthStateInitEvent) {
      yield (AuthStateInit());
    } else if (event is AuthAdminLoggedInEvent) {
      yield AuthAdminLoggedIn(event.state);
    } else if (event is AuthAdminLoginNotSuccesfulEvent) {
      yield AuthAdminLoginNotSuccesful(event.Msg);
    } else if (event is AuthForgotPasswordEvent) {
      yield (AuthForgotPasswordInProgress());
      final messageOnly = await repo.forgotPassword(event.email);
      if (messageOnly.succesful) {
        yield AuthPasswordSentLoginAndChangePassword();
      } else {
        yield AuthForgotPasswordRequestFailed(messageOnly.msg);
      }
    }
  }

  Future<AuthBlocState> login(AuthLoginEvent event) async {
    this.mapEventToState(AdminLoginInProgressEvent());
    final thestate = await repo.loginAdmin(event.email, event.password);
    this.mapEventToState(AuthStateInitEvent());
    if (thestate != null) {
      // print(
      //     "Succesfuly Logged In with the email ${event.email} and password ${event.password}");
      final val = AuthAdminLoggedIn(thestate);
      this.mapEventToState(AuthAdminLoggedInEvent(val.admin));
      return (AuthAdminLoggedIn(thestate));
    }
    final val = AuthAdminLoginNotSuccesful(" invalid username or password! ");
    this.mapEventToState(AuthAdminLoginNotSuccesfulEvent(val.Msg));
    return val;
  }
}
