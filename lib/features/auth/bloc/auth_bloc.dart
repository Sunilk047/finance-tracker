import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/supabase_service.dart';

// ─── Events ───────────────────────────────────────────────────
abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override List<Object?> get props => [];
}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;
  const AuthLoginRequested({required this.email, required this.password});
  @override List<Object?> get props => [email, password];
}

class AuthSignUpRequested extends AuthEvent {
  final String email;
  final String password;
  const AuthSignUpRequested({required this.email, required this.password});
  @override List<Object?> get props => [email, password];
}

class AuthLogoutRequested extends AuthEvent {
  const AuthLogoutRequested();
}

class AuthCheckRequested extends AuthEvent {
  const AuthCheckRequested();
}

// ─── States ───────────────────────────────────────────────────
abstract class AuthState extends Equatable {
  const AuthState();
  @override List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthAuthenticated extends AuthState {
  final String email;
  final String userId;
  const AuthAuthenticated({required this.email, required this.userId});
  @override List<Object?> get props => [email, userId];
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

class AuthSignUpSuccess extends AuthState {
  const AuthSignUpSuccess();
}

class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message);
  @override List<Object?> get props => [message];
}

// ─── BLoC ─────────────────────────────────────────────────────
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial()) {
    on<AuthCheckRequested>(_onCheck);
    on<AuthLoginRequested>(_onLogin);
    on<AuthSignUpRequested>(_onSignUp);
    on<AuthLogoutRequested>(_onLogout);
  }

  void _onCheck(AuthCheckRequested e, Emitter<AuthState> emit) {
    final user = SupabaseService.currentUser;
    if (user != null) {
      emit(AuthAuthenticated(email: user.email ?? '', userId: user.id));
    } else {
      emit(const AuthUnauthenticated());
    }
  }

  Future<void> _onLogin(AuthLoginRequested e, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      final res = await SupabaseService.signIn(email: e.email, password: e.password);
      final user = res.user;
      if (user != null) {
        emit(AuthAuthenticated(email: user.email ?? '', userId: user.id));
      } else {
        emit(const AuthFailure('Login failed. Please try again.'));
      }
    } catch (err) {
      emit(AuthFailure(_parseError(err)));
    }
  }

  Future<void> _onSignUp(AuthSignUpRequested e, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      await SupabaseService.signUp(email: e.email, password: e.password);
      emit(const AuthSignUpSuccess());
    } catch (err) {
      emit(AuthFailure(_parseError(err)));
    }
  }

  Future<void> _onLogout(AuthLogoutRequested e, Emitter<AuthState> emit) async {
    await SupabaseService.signOut();
    emit(const AuthUnauthenticated());
  }

  String _parseError(Object err) {
    final msg = err.toString().toLowerCase();
    if (msg.contains('invalid login')) return 'Invalid email or password.';
    if (msg.contains('already registered')) return 'Email already in use.';
    if (msg.contains('weak password')) return 'Password is too weak.';
    return 'Something went wrong. Please try again.';
  }
}