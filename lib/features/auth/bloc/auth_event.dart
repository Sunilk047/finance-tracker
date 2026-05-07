part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuth() = _CheckAuth;

  const factory AuthEvent.login({required String email, required String password}) = _Login;

  const factory AuthEvent.signUp({required String email, required String password}) = _SignUp;

  const factory AuthEvent.logout() = _Logout;

  const factory AuthEvent.resetAuthStatus() = _ResetAuthStatus;
}
