// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(String email, String password) login,
    required TResult Function(String email, String password) signUp,
    required TResult Function() logout,
    required TResult Function() resetAuthStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(String email, String password)? login,
    TResult? Function(String email, String password)? signUp,
    TResult? Function()? logout,
    TResult? Function()? resetAuthStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(String email, String password)? login,
    TResult Function(String email, String password)? signUp,
    TResult Function()? logout,
    TResult Function()? resetAuthStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_Login value) login,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_Logout value) logout,
    required TResult Function(_ResetAuthStatus value) resetAuthStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_Login value)? login,
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_ResetAuthStatus value)? resetAuthStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_Login value)? login,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_Logout value)? logout,
    TResult Function(_ResetAuthStatus value)? resetAuthStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) = _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CheckAuthImplCopyWith<$Res> {
  factory _$$CheckAuthImplCopyWith(_$CheckAuthImpl value, $Res Function(_$CheckAuthImpl) then) = __$$CheckAuthImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckAuthImplCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res, _$CheckAuthImpl> implements _$$CheckAuthImplCopyWith<$Res> {
  __$$CheckAuthImplCopyWithImpl(_$CheckAuthImpl _value, $Res Function(_$CheckAuthImpl) _then) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckAuthImpl implements _CheckAuth {
  const _$CheckAuthImpl();

  @override
  String toString() {
    return 'AuthEvent.checkAuth()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$CheckAuthImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(String email, String password) login,
    required TResult Function(String email, String password) signUp,
    required TResult Function() logout,
    required TResult Function() resetAuthStatus,
  }) {
    return checkAuth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(String email, String password)? login,
    TResult? Function(String email, String password)? signUp,
    TResult? Function()? logout,
    TResult? Function()? resetAuthStatus,
  }) {
    return checkAuth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(String email, String password)? login,
    TResult Function(String email, String password)? signUp,
    TResult Function()? logout,
    TResult Function()? resetAuthStatus,
    required TResult orElse(),
  }) {
    if (checkAuth != null) {
      return checkAuth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_Login value) login,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_Logout value) logout,
    required TResult Function(_ResetAuthStatus value) resetAuthStatus,
  }) {
    return checkAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_Login value)? login,
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_ResetAuthStatus value)? resetAuthStatus,
  }) {
    return checkAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_Login value)? login,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_Logout value)? logout,
    TResult Function(_ResetAuthStatus value)? resetAuthStatus,
    required TResult orElse(),
  }) {
    if (checkAuth != null) {
      return checkAuth(this);
    }
    return orElse();
  }
}

abstract class _CheckAuth implements AuthEvent {
  const factory _CheckAuth() = _$CheckAuthImpl;
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> {
  factory _$$LoginImplCopyWith(_$LoginImpl value, $Res Function(_$LoginImpl) then) = __$$LoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res, _$LoginImpl> implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(_$LoginImpl _value, $Res Function(_$LoginImpl) _then) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$LoginImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoginImpl implements _Login {
  const _$LoginImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.login(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) || other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith => __$$LoginImplCopyWithImpl<_$LoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(String email, String password) login,
    required TResult Function(String email, String password) signUp,
    required TResult Function() logout,
    required TResult Function() resetAuthStatus,
  }) {
    return login(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(String email, String password)? login,
    TResult? Function(String email, String password)? signUp,
    TResult? Function()? logout,
    TResult? Function()? resetAuthStatus,
  }) {
    return login?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(String email, String password)? login,
    TResult Function(String email, String password)? signUp,
    TResult Function()? logout,
    TResult Function()? resetAuthStatus,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_Login value) login,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_Logout value) logout,
    required TResult Function(_ResetAuthStatus value) resetAuthStatus,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_Login value)? login,
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_ResetAuthStatus value)? resetAuthStatus,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_Login value)? login,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_Logout value)? logout,
    TResult Function(_ResetAuthStatus value)? resetAuthStatus,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login implements AuthEvent {
  const factory _Login({required final String email, required final String password}) = _$LoginImpl;

  String get email;
  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpImplCopyWith<$Res> {
  factory _$$SignUpImplCopyWith(_$SignUpImpl value, $Res Function(_$SignUpImpl) then) = __$$SignUpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignUpImplCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res, _$SignUpImpl> implements _$$SignUpImplCopyWith<$Res> {
  __$$SignUpImplCopyWithImpl(_$SignUpImpl _value, $Res Function(_$SignUpImpl) _then) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$SignUpImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SignUpImpl implements _SignUp {
  const _$SignUpImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.signUp(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) || other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpImplCopyWith<_$SignUpImpl> get copyWith => __$$SignUpImplCopyWithImpl<_$SignUpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(String email, String password) login,
    required TResult Function(String email, String password) signUp,
    required TResult Function() logout,
    required TResult Function() resetAuthStatus,
  }) {
    return signUp(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(String email, String password)? login,
    TResult? Function(String email, String password)? signUp,
    TResult? Function()? logout,
    TResult? Function()? resetAuthStatus,
  }) {
    return signUp?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(String email, String password)? login,
    TResult Function(String email, String password)? signUp,
    TResult Function()? logout,
    TResult Function()? resetAuthStatus,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_Login value) login,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_Logout value) logout,
    required TResult Function(_ResetAuthStatus value) resetAuthStatus,
  }) {
    return signUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_Login value)? login,
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_ResetAuthStatus value)? resetAuthStatus,
  }) {
    return signUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_Login value)? login,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_Logout value)? logout,
    TResult Function(_ResetAuthStatus value)? resetAuthStatus,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(this);
    }
    return orElse();
  }
}

abstract class _SignUp implements AuthEvent {
  const factory _SignUp({required final String email, required final String password}) = _$SignUpImpl;

  String get email;
  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpImplCopyWith<_$SignUpImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(_$LogoutImpl value, $Res Function(_$LogoutImpl) then) = __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res, _$LogoutImpl> implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(_$LogoutImpl _value, $Res Function(_$LogoutImpl) _then) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutImpl implements _Logout {
  const _$LogoutImpl();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$LogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(String email, String password) login,
    required TResult Function(String email, String password) signUp,
    required TResult Function() logout,
    required TResult Function() resetAuthStatus,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(String email, String password)? login,
    TResult? Function(String email, String password)? signUp,
    TResult? Function()? logout,
    TResult? Function()? resetAuthStatus,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(String email, String password)? login,
    TResult Function(String email, String password)? signUp,
    TResult Function()? logout,
    TResult Function()? resetAuthStatus,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_Login value) login,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_Logout value) logout,
    required TResult Function(_ResetAuthStatus value) resetAuthStatus,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_Login value)? login,
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_ResetAuthStatus value)? resetAuthStatus,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_Login value)? login,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_Logout value)? logout,
    TResult Function(_ResetAuthStatus value)? resetAuthStatus,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements AuthEvent {
  const factory _Logout() = _$LogoutImpl;
}

/// @nodoc
abstract class _$$ResetAuthStatusImplCopyWith<$Res> {
  factory _$$ResetAuthStatusImplCopyWith(_$ResetAuthStatusImpl value, $Res Function(_$ResetAuthStatusImpl) then) =
      __$$ResetAuthStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetAuthStatusImplCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res, _$ResetAuthStatusImpl>
    implements _$$ResetAuthStatusImplCopyWith<$Res> {
  __$$ResetAuthStatusImplCopyWithImpl(_$ResetAuthStatusImpl _value, $Res Function(_$ResetAuthStatusImpl) _then) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetAuthStatusImpl implements _ResetAuthStatus {
  const _$ResetAuthStatusImpl();

  @override
  String toString() {
    return 'AuthEvent.resetAuthStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$ResetAuthStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuth,
    required TResult Function(String email, String password) login,
    required TResult Function(String email, String password) signUp,
    required TResult Function() logout,
    required TResult Function() resetAuthStatus,
  }) {
    return resetAuthStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuth,
    TResult? Function(String email, String password)? login,
    TResult? Function(String email, String password)? signUp,
    TResult? Function()? logout,
    TResult? Function()? resetAuthStatus,
  }) {
    return resetAuthStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuth,
    TResult Function(String email, String password)? login,
    TResult Function(String email, String password)? signUp,
    TResult Function()? logout,
    TResult Function()? resetAuthStatus,
    required TResult orElse(),
  }) {
    if (resetAuthStatus != null) {
      return resetAuthStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuth value) checkAuth,
    required TResult Function(_Login value) login,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_Logout value) logout,
    required TResult Function(_ResetAuthStatus value) resetAuthStatus,
  }) {
    return resetAuthStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuth value)? checkAuth,
    TResult? Function(_Login value)? login,
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_ResetAuthStatus value)? resetAuthStatus,
  }) {
    return resetAuthStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuth value)? checkAuth,
    TResult Function(_Login value)? login,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_Logout value)? logout,
    TResult Function(_ResetAuthStatus value)? resetAuthStatus,
    required TResult orElse(),
  }) {
    if (resetAuthStatus != null) {
      return resetAuthStatus(this);
    }
    return orElse();
  }
}

abstract class _ResetAuthStatus implements AuthEvent {
  const factory _ResetAuthStatus() = _$ResetAuthStatusImpl;
}

/// @nodoc
mixin _$AuthState {
  // required SupabaseService repo,
  AuthStatus get status => throw _privateConstructorUsedError;
  AuthStatus get loginStatus => throw _privateConstructorUsedError;
  AuthStatus get signUpStatus => throw _privateConstructorUsedError;
  AuthStatus get logoutStatus => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) = _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({AuthStatus status, AuthStatus loginStatus, AuthStatus signUpStatus, AuthStatus logoutStatus, String email, String userId, String error});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? loginStatus = null,
    Object? signUpStatus = null,
    Object? logoutStatus = null,
    Object? email = null,
    Object? userId = null,
    Object? error = null,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as AuthStatus,
            loginStatus: null == loginStatus
                ? _value.loginStatus
                : loginStatus // ignore: cast_nullable_to_non_nullable
                      as AuthStatus,
            signUpStatus: null == signUpStatus
                ? _value.signUpStatus
                : signUpStatus // ignore: cast_nullable_to_non_nullable
                      as AuthStatus,
            logoutStatus: null == logoutStatus
                ? _value.logoutStatus
                : logoutStatus // ignore: cast_nullable_to_non_nullable
                      as AuthStatus,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            error: null == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(_$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) = __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthStatus status, AuthStatus loginStatus, AuthStatus signUpStatus, AuthStatus logoutStatus, String email, String userId, String error});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl> implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(_$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? loginStatus = null,
    Object? signUpStatus = null,
    Object? logoutStatus = null,
    Object? email = null,
    Object? userId = null,
    Object? error = null,
  }) {
    return _then(
      _$AuthStateImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AuthStatus,
        loginStatus: null == loginStatus
            ? _value.loginStatus
            : loginStatus // ignore: cast_nullable_to_non_nullable
                  as AuthStatus,
        signUpStatus: null == signUpStatus
            ? _value.signUpStatus
            : signUpStatus // ignore: cast_nullable_to_non_nullable
                  as AuthStatus,
        logoutStatus: null == logoutStatus
            ? _value.logoutStatus
            : logoutStatus // ignore: cast_nullable_to_non_nullable
                  as AuthStatus,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        error: null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl({
    this.status = AuthStatus.initial,
    this.loginStatus = AuthStatus.initial,
    this.signUpStatus = AuthStatus.initial,
    this.logoutStatus = AuthStatus.initial,
    this.email = '',
    this.userId = '',
    this.error = '',
  });

  // required SupabaseService repo,
  @override
  @JsonKey()
  final AuthStatus status;
  @override
  @JsonKey()
  final AuthStatus loginStatus;
  @override
  @JsonKey()
  final AuthStatus signUpStatus;
  @override
  @JsonKey()
  final AuthStatus logoutStatus;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'AuthState(status: $status, loginStatus: $loginStatus, signUpStatus: $signUpStatus, logoutStatus: $logoutStatus, email: $email, userId: $userId, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.loginStatus, loginStatus) || other.loginStatus == loginStatus) &&
            (identical(other.signUpStatus, signUpStatus) || other.signUpStatus == signUpStatus) &&
            (identical(other.logoutStatus, logoutStatus) || other.logoutStatus == logoutStatus) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, loginStatus, signUpStatus, logoutStatus, email, userId, error);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith => __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState({
    final AuthStatus status,
    final AuthStatus loginStatus,
    final AuthStatus signUpStatus,
    final AuthStatus logoutStatus,
    final String email,
    final String userId,
    final String error,
  }) = _$AuthStateImpl;

  // required SupabaseService repo,
  @override
  AuthStatus get status;
  @override
  AuthStatus get loginStatus;
  @override
  AuthStatus get signUpStatus;
  @override
  AuthStatus get logoutStatus;
  @override
  String get email;
  @override
  String get userId;
  @override
  String get error;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith => throw _privateConstructorUsedError;
}
