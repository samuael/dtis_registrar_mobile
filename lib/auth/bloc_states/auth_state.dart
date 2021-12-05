import "../../libs.dart";

class AuthBlocState {}

class AuthStateInit extends AuthBlocState {}

class AuthAdminLoggedIn extends AuthBlocState {
  Admin admin;
  AuthAdminLoggedIn(this.admin);
}

class AuthAdminLoginNotSuccesful extends AuthBlocState {}
