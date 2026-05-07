import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../services/supabase_service.dart';
part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<_CheckAuth>(_onCheckAuth);
    on<_Login>(_onLogin);
    on<_SignUp>(_onSignUp);
    on<_Logout>(_onLogout);
    on<_ResetAuthStatus>(_onResetAuthStatus);
  }

  Future<void> _onCheckAuth(_CheckAuth event, Emitter<AuthState> emit) async {
    final user = SupabaseService.currentUser;

    if (user != null) {
      emit(state.copyWith(status: AuthStatus.authenticated, email: user.email ?? '', userId: user.id));
    } else {
      emit(state.copyWith(status: AuthStatus.unauthenticated));
    }
  }

  Future<void> _onLogin(_Login event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loginStatus: AuthStatus.loading, status: AuthStatus.loading, error: ''));

    try {
      final res = await SupabaseService.signIn(email: event.email, password: event.password);

      final user = res.user;

      if (user != null) {
        emit(state.copyWith(loginStatus: AuthStatus.success, status: AuthStatus.authenticated, email: user.email ?? '', userId: user.id));
      } else {
        emit(state.copyWith(loginStatus: AuthStatus.error, status: AuthStatus.error, error: 'Login failed. Please try again.'));
      }
    } catch (err) {
      emit(state.copyWith(loginStatus: AuthStatus.error, status: AuthStatus.error, error: _parseError(err)));
    }
  }

  Future<void> _onSignUp(_SignUp event, Emitter<AuthState> emit) async {
    emit(state.copyWith(signUpStatus: AuthStatus.loading, status: AuthStatus.loading, error: ''));

    try {
      await SupabaseService.signUp(email: event.email, password: event.password);

      emit(state.copyWith(signUpStatus: AuthStatus.success, status: AuthStatus.success));
    } catch (err) {
      emit(state.copyWith(signUpStatus: AuthStatus.error, status: AuthStatus.error, error: _parseError(err)));
    }
  }

  Future<void> _onLogout(_Logout event, Emitter<AuthState> emit) async {
    emit(state.copyWith(logoutStatus: AuthStatus.loading, status: AuthStatus.loading));

    try {
      await SupabaseService.signOut();

      emit(state.copyWith(logoutStatus: AuthStatus.success, status: AuthStatus.unauthenticated, email: '', userId: ''));
    } catch (err) {
      emit(state.copyWith(logoutStatus: AuthStatus.error, status: AuthStatus.error, error: _parseError(err)));
    }
  }

  void _onResetAuthStatus(_ResetAuthStatus event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        loginStatus: AuthStatus.initial,
        signUpStatus: AuthStatus.initial,
        logoutStatus: AuthStatus.initial,
        status: AuthStatus.initial,
        error: '',
      ),
    );
  }

  String _parseError(Object err) {
    final msg = err.toString().toLowerCase();

    if (msg.contains('invalid login')) {
      return 'Invalid email or password.';
    }

    if (msg.contains('already registered')) {
      return 'Email already in use.';
    }

    if (msg.contains('weak password')) {
      return 'Password is too weak.';
    }

    return 'Something went wrong. Please try again.';
  }
}
