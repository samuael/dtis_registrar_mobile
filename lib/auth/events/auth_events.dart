class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  String email;
  String password;
  AuthLoginEvent(this.email, this.password);
}
