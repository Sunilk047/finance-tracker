part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    // required SupabaseService repo,
    @Default(AuthStatus.initial) AuthStatus status,
    @Default(AuthStatus.initial) AuthStatus loginStatus,
    @Default(AuthStatus.initial) AuthStatus signUpStatus,
    @Default(AuthStatus.initial) AuthStatus logoutStatus,

    @Default('') String email,
    @Default('') String userId,

    @Default('') String error,
  }) = _AuthState;
}

enum AuthStatus { initial, loading, success, error, authenticated, unauthenticated }
