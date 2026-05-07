// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AccountsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountsLoadRequested,
    required TResult Function(String name, int colorIndex) accountsCreateRequested,
    required TResult Function(String accountId) accountsDeleteRequested,
    required TResult Function(Account account) accountsSummaryLoadRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountsLoadRequested,
    TResult? Function(String name, int colorIndex)? accountsCreateRequested,
    TResult? Function(String accountId)? accountsDeleteRequested,
    TResult? Function(Account account)? accountsSummaryLoadRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountsLoadRequested,
    TResult Function(String name, int colorIndex)? accountsCreateRequested,
    TResult Function(String accountId)? accountsDeleteRequested,
    TResult Function(Account account)? accountsSummaryLoadRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountsLoadRequested value) accountsLoadRequested,
    required TResult Function(_AccountsCreateRequested value) accountsCreateRequested,
    required TResult Function(_AccountsDeleteRequested value) accountsDeleteRequested,
    required TResult Function(_AccountsSummaryLoadRequested value) accountsSummaryLoadRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountsLoadRequested value)? accountsLoadRequested,
    TResult? Function(_AccountsCreateRequested value)? accountsCreateRequested,
    TResult? Function(_AccountsDeleteRequested value)? accountsDeleteRequested,
    TResult? Function(_AccountsSummaryLoadRequested value)? accountsSummaryLoadRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountsLoadRequested value)? accountsLoadRequested,
    TResult Function(_AccountsCreateRequested value)? accountsCreateRequested,
    TResult Function(_AccountsDeleteRequested value)? accountsDeleteRequested,
    TResult Function(_AccountsSummaryLoadRequested value)? accountsSummaryLoadRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsEventCopyWith<$Res> {
  factory $AccountsEventCopyWith(AccountsEvent value, $Res Function(AccountsEvent) then) = _$AccountsEventCopyWithImpl<$Res, AccountsEvent>;
}

/// @nodoc
class _$AccountsEventCopyWithImpl<$Res, $Val extends AccountsEvent> implements $AccountsEventCopyWith<$Res> {
  _$AccountsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AccountsLoadRequestedImplCopyWith<$Res> {
  factory _$$AccountsLoadRequestedImplCopyWith(_$AccountsLoadRequestedImpl value, $Res Function(_$AccountsLoadRequestedImpl) then) =
      __$$AccountsLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountsLoadRequestedImplCopyWithImpl<$Res> extends _$AccountsEventCopyWithImpl<$Res, _$AccountsLoadRequestedImpl>
    implements _$$AccountsLoadRequestedImplCopyWith<$Res> {
  __$$AccountsLoadRequestedImplCopyWithImpl(_$AccountsLoadRequestedImpl _value, $Res Function(_$AccountsLoadRequestedImpl) _then)
    : super(_value, _then);

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AccountsLoadRequestedImpl implements _AccountsLoadRequested {
  const _$AccountsLoadRequestedImpl();

  @override
  String toString() {
    return 'AccountsEvent.accountsLoadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$AccountsLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountsLoadRequested,
    required TResult Function(String name, int colorIndex) accountsCreateRequested,
    required TResult Function(String accountId) accountsDeleteRequested,
    required TResult Function(Account account) accountsSummaryLoadRequested,
  }) {
    return accountsLoadRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountsLoadRequested,
    TResult? Function(String name, int colorIndex)? accountsCreateRequested,
    TResult? Function(String accountId)? accountsDeleteRequested,
    TResult? Function(Account account)? accountsSummaryLoadRequested,
  }) {
    return accountsLoadRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountsLoadRequested,
    TResult Function(String name, int colorIndex)? accountsCreateRequested,
    TResult Function(String accountId)? accountsDeleteRequested,
    TResult Function(Account account)? accountsSummaryLoadRequested,
    required TResult orElse(),
  }) {
    if (accountsLoadRequested != null) {
      return accountsLoadRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountsLoadRequested value) accountsLoadRequested,
    required TResult Function(_AccountsCreateRequested value) accountsCreateRequested,
    required TResult Function(_AccountsDeleteRequested value) accountsDeleteRequested,
    required TResult Function(_AccountsSummaryLoadRequested value) accountsSummaryLoadRequested,
  }) {
    return accountsLoadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountsLoadRequested value)? accountsLoadRequested,
    TResult? Function(_AccountsCreateRequested value)? accountsCreateRequested,
    TResult? Function(_AccountsDeleteRequested value)? accountsDeleteRequested,
    TResult? Function(_AccountsSummaryLoadRequested value)? accountsSummaryLoadRequested,
  }) {
    return accountsLoadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountsLoadRequested value)? accountsLoadRequested,
    TResult Function(_AccountsCreateRequested value)? accountsCreateRequested,
    TResult Function(_AccountsDeleteRequested value)? accountsDeleteRequested,
    TResult Function(_AccountsSummaryLoadRequested value)? accountsSummaryLoadRequested,
    required TResult orElse(),
  }) {
    if (accountsLoadRequested != null) {
      return accountsLoadRequested(this);
    }
    return orElse();
  }
}

abstract class _AccountsLoadRequested implements AccountsEvent {
  const factory _AccountsLoadRequested() = _$AccountsLoadRequestedImpl;
}

/// @nodoc
abstract class _$$AccountsCreateRequestedImplCopyWith<$Res> {
  factory _$$AccountsCreateRequestedImplCopyWith(_$AccountsCreateRequestedImpl value, $Res Function(_$AccountsCreateRequestedImpl) then) =
      __$$AccountsCreateRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, int colorIndex});
}

/// @nodoc
class __$$AccountsCreateRequestedImplCopyWithImpl<$Res> extends _$AccountsEventCopyWithImpl<$Res, _$AccountsCreateRequestedImpl>
    implements _$$AccountsCreateRequestedImplCopyWith<$Res> {
  __$$AccountsCreateRequestedImplCopyWithImpl(_$AccountsCreateRequestedImpl _value, $Res Function(_$AccountsCreateRequestedImpl) _then)
    : super(_value, _then);

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? colorIndex = null}) {
    return _then(
      _$AccountsCreateRequestedImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        colorIndex: null == colorIndex
            ? _value.colorIndex
            : colorIndex // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$AccountsCreateRequestedImpl implements _AccountsCreateRequested {
  const _$AccountsCreateRequestedImpl({required this.name, required this.colorIndex});

  @override
  final String name;
  @override
  final int colorIndex;

  @override
  String toString() {
    return 'AccountsEvent.accountsCreateRequested(name: $name, colorIndex: $colorIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsCreateRequestedImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.colorIndex, colorIndex) || other.colorIndex == colorIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, colorIndex);

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsCreateRequestedImplCopyWith<_$AccountsCreateRequestedImpl> get copyWith =>
      __$$AccountsCreateRequestedImplCopyWithImpl<_$AccountsCreateRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountsLoadRequested,
    required TResult Function(String name, int colorIndex) accountsCreateRequested,
    required TResult Function(String accountId) accountsDeleteRequested,
    required TResult Function(Account account) accountsSummaryLoadRequested,
  }) {
    return accountsCreateRequested(name, colorIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountsLoadRequested,
    TResult? Function(String name, int colorIndex)? accountsCreateRequested,
    TResult? Function(String accountId)? accountsDeleteRequested,
    TResult? Function(Account account)? accountsSummaryLoadRequested,
  }) {
    return accountsCreateRequested?.call(name, colorIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountsLoadRequested,
    TResult Function(String name, int colorIndex)? accountsCreateRequested,
    TResult Function(String accountId)? accountsDeleteRequested,
    TResult Function(Account account)? accountsSummaryLoadRequested,
    required TResult orElse(),
  }) {
    if (accountsCreateRequested != null) {
      return accountsCreateRequested(name, colorIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountsLoadRequested value) accountsLoadRequested,
    required TResult Function(_AccountsCreateRequested value) accountsCreateRequested,
    required TResult Function(_AccountsDeleteRequested value) accountsDeleteRequested,
    required TResult Function(_AccountsSummaryLoadRequested value) accountsSummaryLoadRequested,
  }) {
    return accountsCreateRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountsLoadRequested value)? accountsLoadRequested,
    TResult? Function(_AccountsCreateRequested value)? accountsCreateRequested,
    TResult? Function(_AccountsDeleteRequested value)? accountsDeleteRequested,
    TResult? Function(_AccountsSummaryLoadRequested value)? accountsSummaryLoadRequested,
  }) {
    return accountsCreateRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountsLoadRequested value)? accountsLoadRequested,
    TResult Function(_AccountsCreateRequested value)? accountsCreateRequested,
    TResult Function(_AccountsDeleteRequested value)? accountsDeleteRequested,
    TResult Function(_AccountsSummaryLoadRequested value)? accountsSummaryLoadRequested,
    required TResult orElse(),
  }) {
    if (accountsCreateRequested != null) {
      return accountsCreateRequested(this);
    }
    return orElse();
  }
}

abstract class _AccountsCreateRequested implements AccountsEvent {
  const factory _AccountsCreateRequested({required final String name, required final int colorIndex}) = _$AccountsCreateRequestedImpl;

  String get name;
  int get colorIndex;

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsCreateRequestedImplCopyWith<_$AccountsCreateRequestedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountsDeleteRequestedImplCopyWith<$Res> {
  factory _$$AccountsDeleteRequestedImplCopyWith(_$AccountsDeleteRequestedImpl value, $Res Function(_$AccountsDeleteRequestedImpl) then) =
      __$$AccountsDeleteRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String accountId});
}

/// @nodoc
class __$$AccountsDeleteRequestedImplCopyWithImpl<$Res> extends _$AccountsEventCopyWithImpl<$Res, _$AccountsDeleteRequestedImpl>
    implements _$$AccountsDeleteRequestedImplCopyWith<$Res> {
  __$$AccountsDeleteRequestedImplCopyWithImpl(_$AccountsDeleteRequestedImpl _value, $Res Function(_$AccountsDeleteRequestedImpl) _then)
    : super(_value, _then);

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accountId = null}) {
    return _then(
      _$AccountsDeleteRequestedImpl(
        accountId: null == accountId
            ? _value.accountId
            : accountId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AccountsDeleteRequestedImpl implements _AccountsDeleteRequested {
  const _$AccountsDeleteRequestedImpl({required this.accountId});

  @override
  final String accountId;

  @override
  String toString() {
    return 'AccountsEvent.accountsDeleteRequested(accountId: $accountId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsDeleteRequestedImpl &&
            (identical(other.accountId, accountId) || other.accountId == accountId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountId);

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsDeleteRequestedImplCopyWith<_$AccountsDeleteRequestedImpl> get copyWith =>
      __$$AccountsDeleteRequestedImplCopyWithImpl<_$AccountsDeleteRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountsLoadRequested,
    required TResult Function(String name, int colorIndex) accountsCreateRequested,
    required TResult Function(String accountId) accountsDeleteRequested,
    required TResult Function(Account account) accountsSummaryLoadRequested,
  }) {
    return accountsDeleteRequested(accountId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountsLoadRequested,
    TResult? Function(String name, int colorIndex)? accountsCreateRequested,
    TResult? Function(String accountId)? accountsDeleteRequested,
    TResult? Function(Account account)? accountsSummaryLoadRequested,
  }) {
    return accountsDeleteRequested?.call(accountId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountsLoadRequested,
    TResult Function(String name, int colorIndex)? accountsCreateRequested,
    TResult Function(String accountId)? accountsDeleteRequested,
    TResult Function(Account account)? accountsSummaryLoadRequested,
    required TResult orElse(),
  }) {
    if (accountsDeleteRequested != null) {
      return accountsDeleteRequested(accountId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountsLoadRequested value) accountsLoadRequested,
    required TResult Function(_AccountsCreateRequested value) accountsCreateRequested,
    required TResult Function(_AccountsDeleteRequested value) accountsDeleteRequested,
    required TResult Function(_AccountsSummaryLoadRequested value) accountsSummaryLoadRequested,
  }) {
    return accountsDeleteRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountsLoadRequested value)? accountsLoadRequested,
    TResult? Function(_AccountsCreateRequested value)? accountsCreateRequested,
    TResult? Function(_AccountsDeleteRequested value)? accountsDeleteRequested,
    TResult? Function(_AccountsSummaryLoadRequested value)? accountsSummaryLoadRequested,
  }) {
    return accountsDeleteRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountsLoadRequested value)? accountsLoadRequested,
    TResult Function(_AccountsCreateRequested value)? accountsCreateRequested,
    TResult Function(_AccountsDeleteRequested value)? accountsDeleteRequested,
    TResult Function(_AccountsSummaryLoadRequested value)? accountsSummaryLoadRequested,
    required TResult orElse(),
  }) {
    if (accountsDeleteRequested != null) {
      return accountsDeleteRequested(this);
    }
    return orElse();
  }
}

abstract class _AccountsDeleteRequested implements AccountsEvent {
  const factory _AccountsDeleteRequested({required final String accountId}) = _$AccountsDeleteRequestedImpl;

  String get accountId;

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsDeleteRequestedImplCopyWith<_$AccountsDeleteRequestedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountsSummaryLoadRequestedImplCopyWith<$Res> {
  factory _$$AccountsSummaryLoadRequestedImplCopyWith(
    _$AccountsSummaryLoadRequestedImpl value,
    $Res Function(_$AccountsSummaryLoadRequestedImpl) then,
  ) = __$$AccountsSummaryLoadRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Account account});
}

/// @nodoc
class __$$AccountsSummaryLoadRequestedImplCopyWithImpl<$Res> extends _$AccountsEventCopyWithImpl<$Res, _$AccountsSummaryLoadRequestedImpl>
    implements _$$AccountsSummaryLoadRequestedImplCopyWith<$Res> {
  __$$AccountsSummaryLoadRequestedImplCopyWithImpl(_$AccountsSummaryLoadRequestedImpl _value, $Res Function(_$AccountsSummaryLoadRequestedImpl) _then)
    : super(_value, _then);

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? account = null}) {
    return _then(
      _$AccountsSummaryLoadRequestedImpl(
        account: null == account
            ? _value.account
            : account // ignore: cast_nullable_to_non_nullable
                  as Account,
      ),
    );
  }
}

/// @nodoc

class _$AccountsSummaryLoadRequestedImpl implements _AccountsSummaryLoadRequested {
  const _$AccountsSummaryLoadRequestedImpl({required this.account});

  @override
  final Account account;

  @override
  String toString() {
    return 'AccountsEvent.accountsSummaryLoadRequested(account: $account)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsSummaryLoadRequestedImpl &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsSummaryLoadRequestedImplCopyWith<_$AccountsSummaryLoadRequestedImpl> get copyWith =>
      __$$AccountsSummaryLoadRequestedImplCopyWithImpl<_$AccountsSummaryLoadRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountsLoadRequested,
    required TResult Function(String name, int colorIndex) accountsCreateRequested,
    required TResult Function(String accountId) accountsDeleteRequested,
    required TResult Function(Account account) accountsSummaryLoadRequested,
  }) {
    return accountsSummaryLoadRequested(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountsLoadRequested,
    TResult? Function(String name, int colorIndex)? accountsCreateRequested,
    TResult? Function(String accountId)? accountsDeleteRequested,
    TResult? Function(Account account)? accountsSummaryLoadRequested,
  }) {
    return accountsSummaryLoadRequested?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountsLoadRequested,
    TResult Function(String name, int colorIndex)? accountsCreateRequested,
    TResult Function(String accountId)? accountsDeleteRequested,
    TResult Function(Account account)? accountsSummaryLoadRequested,
    required TResult orElse(),
  }) {
    if (accountsSummaryLoadRequested != null) {
      return accountsSummaryLoadRequested(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountsLoadRequested value) accountsLoadRequested,
    required TResult Function(_AccountsCreateRequested value) accountsCreateRequested,
    required TResult Function(_AccountsDeleteRequested value) accountsDeleteRequested,
    required TResult Function(_AccountsSummaryLoadRequested value) accountsSummaryLoadRequested,
  }) {
    return accountsSummaryLoadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountsLoadRequested value)? accountsLoadRequested,
    TResult? Function(_AccountsCreateRequested value)? accountsCreateRequested,
    TResult? Function(_AccountsDeleteRequested value)? accountsDeleteRequested,
    TResult? Function(_AccountsSummaryLoadRequested value)? accountsSummaryLoadRequested,
  }) {
    return accountsSummaryLoadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountsLoadRequested value)? accountsLoadRequested,
    TResult Function(_AccountsCreateRequested value)? accountsCreateRequested,
    TResult Function(_AccountsDeleteRequested value)? accountsDeleteRequested,
    TResult Function(_AccountsSummaryLoadRequested value)? accountsSummaryLoadRequested,
    required TResult orElse(),
  }) {
    if (accountsSummaryLoadRequested != null) {
      return accountsSummaryLoadRequested(this);
    }
    return orElse();
  }
}

abstract class _AccountsSummaryLoadRequested implements AccountsEvent {
  const factory _AccountsSummaryLoadRequested({required final Account account}) = _$AccountsSummaryLoadRequestedImpl;

  Account get account;

  /// Create a copy of AccountsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsSummaryLoadRequestedImplCopyWith<_$AccountsSummaryLoadRequestedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AccountsState {
  AccountsStatus get status => throw _privateConstructorUsedError;
  List<Account> get accounts => throw _privateConstructorUsedError;
  Map<String, AccountSummary> get summaries => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountsStateCopyWith<AccountsState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsStateCopyWith<$Res> {
  factory $AccountsStateCopyWith(AccountsState value, $Res Function(AccountsState) then) = _$AccountsStateCopyWithImpl<$Res, AccountsState>;
  @useResult
  $Res call({AccountsStatus status, List<Account> accounts, Map<String, AccountSummary> summaries, String error});
}

/// @nodoc
class _$AccountsStateCopyWithImpl<$Res, $Val extends AccountsState> implements $AccountsStateCopyWith<$Res> {
  _$AccountsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = null, Object? accounts = null, Object? summaries = null, Object? error = null}) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as AccountsStatus,
            accounts: null == accounts
                ? _value.accounts
                : accounts // ignore: cast_nullable_to_non_nullable
                      as List<Account>,
            summaries: null == summaries
                ? _value.summaries
                : summaries // ignore: cast_nullable_to_non_nullable
                      as Map<String, AccountSummary>,
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
abstract class _$$AccountsStateImplCopyWith<$Res> implements $AccountsStateCopyWith<$Res> {
  factory _$$AccountsStateImplCopyWith(_$AccountsStateImpl value, $Res Function(_$AccountsStateImpl) then) = __$$AccountsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AccountsStatus status, List<Account> accounts, Map<String, AccountSummary> summaries, String error});
}

/// @nodoc
class __$$AccountsStateImplCopyWithImpl<$Res> extends _$AccountsStateCopyWithImpl<$Res, _$AccountsStateImpl>
    implements _$$AccountsStateImplCopyWith<$Res> {
  __$$AccountsStateImplCopyWithImpl(_$AccountsStateImpl _value, $Res Function(_$AccountsStateImpl) _then) : super(_value, _then);

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = null, Object? accounts = null, Object? summaries = null, Object? error = null}) {
    return _then(
      _$AccountsStateImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AccountsStatus,
        accounts: null == accounts
            ? _value._accounts
            : accounts // ignore: cast_nullable_to_non_nullable
                  as List<Account>,
        summaries: null == summaries
            ? _value._summaries
            : summaries // ignore: cast_nullable_to_non_nullable
                  as Map<String, AccountSummary>,
        error: null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AccountsStateImpl implements _AccountsState {
  const _$AccountsStateImpl({
    this.status = AccountsStatus.initial,
    final List<Account> accounts = const [],
    final Map<String, AccountSummary> summaries = const {},
    this.error = '',
  }) : _accounts = accounts,
       _summaries = summaries;

  @override
  @JsonKey()
  final AccountsStatus status;
  final List<Account> _accounts;
  @override
  @JsonKey()
  List<Account> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  final Map<String, AccountSummary> _summaries;
  @override
  @JsonKey()
  Map<String, AccountSummary> get summaries {
    if (_summaries is EqualUnmodifiableMapView) return _summaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_summaries);
  }

  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'AccountsState(status: $status, accounts: $accounts, summaries: $summaries, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            const DeepCollectionEquality().equals(other._summaries, _summaries) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, const DeepCollectionEquality().hash(_accounts), const DeepCollectionEquality().hash(_summaries), error);

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsStateImplCopyWith<_$AccountsStateImpl> get copyWith => __$$AccountsStateImplCopyWithImpl<_$AccountsStateImpl>(this, _$identity);
}

abstract class _AccountsState implements AccountsState {
  const factory _AccountsState({
    final AccountsStatus status,
    final List<Account> accounts,
    final Map<String, AccountSummary> summaries,
    final String error,
  }) = _$AccountsStateImpl;

  @override
  AccountsStatus get status;
  @override
  List<Account> get accounts;
  @override
  Map<String, AccountSummary> get summaries;
  @override
  String get error;

  /// Create a copy of AccountsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsStateImplCopyWith<_$AccountsStateImpl> get copyWith => throw _privateConstructorUsedError;
}
