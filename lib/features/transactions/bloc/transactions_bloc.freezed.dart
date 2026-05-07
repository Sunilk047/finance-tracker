// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TransactionsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String accountId) transactionsLoadRequested,
    required TResult Function(String accountId, String title, double amount, TransactionType type, String? note) transactionsAddRequested,
    required TResult Function(String transactionId) transactionsDeleteRequested,
    required TResult Function(TransactionFilter filter) transactionsFilterChanged,
    required TResult Function(String query) transactionsSearchChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String accountId)? transactionsLoadRequested,
    TResult? Function(String accountId, String title, double amount, TransactionType type, String? note)? transactionsAddRequested,
    TResult? Function(String transactionId)? transactionsDeleteRequested,
    TResult? Function(TransactionFilter filter)? transactionsFilterChanged,
    TResult? Function(String query)? transactionsSearchChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String accountId)? transactionsLoadRequested,
    TResult Function(String accountId, String title, double amount, TransactionType type, String? note)? transactionsAddRequested,
    TResult Function(String transactionId)? transactionsDeleteRequested,
    TResult Function(TransactionFilter filter)? transactionsFilterChanged,
    TResult Function(String query)? transactionsSearchChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionsLoadRequested value) transactionsLoadRequested,
    required TResult Function(TransactionsAddRequested value) transactionsAddRequested,
    required TResult Function(TransactionsDeleteRequested value) transactionsDeleteRequested,
    required TResult Function(TransactionsFilterChanged value) transactionsFilterChanged,
    required TResult Function(TransactionsSearchChanged value) transactionsSearchChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionsLoadRequested value)? transactionsLoadRequested,
    TResult? Function(TransactionsAddRequested value)? transactionsAddRequested,
    TResult? Function(TransactionsDeleteRequested value)? transactionsDeleteRequested,
    TResult? Function(TransactionsFilterChanged value)? transactionsFilterChanged,
    TResult? Function(TransactionsSearchChanged value)? transactionsSearchChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionsLoadRequested value)? transactionsLoadRequested,
    TResult Function(TransactionsAddRequested value)? transactionsAddRequested,
    TResult Function(TransactionsDeleteRequested value)? transactionsDeleteRequested,
    TResult Function(TransactionsFilterChanged value)? transactionsFilterChanged,
    TResult Function(TransactionsSearchChanged value)? transactionsSearchChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsEventCopyWith<$Res> {
  factory $TransactionsEventCopyWith(TransactionsEvent value, $Res Function(TransactionsEvent) then) =
      _$TransactionsEventCopyWithImpl<$Res, TransactionsEvent>;
}

/// @nodoc
class _$TransactionsEventCopyWithImpl<$Res, $Val extends TransactionsEvent> implements $TransactionsEventCopyWith<$Res> {
  _$TransactionsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TransactionsLoadRequestedImplCopyWith<$Res> {
  factory _$$TransactionsLoadRequestedImplCopyWith(_$TransactionsLoadRequestedImpl value, $Res Function(_$TransactionsLoadRequestedImpl) then) =
      __$$TransactionsLoadRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String accountId});
}

/// @nodoc
class __$$TransactionsLoadRequestedImplCopyWithImpl<$Res> extends _$TransactionsEventCopyWithImpl<$Res, _$TransactionsLoadRequestedImpl>
    implements _$$TransactionsLoadRequestedImplCopyWith<$Res> {
  __$$TransactionsLoadRequestedImplCopyWithImpl(_$TransactionsLoadRequestedImpl _value, $Res Function(_$TransactionsLoadRequestedImpl) _then)
    : super(_value, _then);

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accountId = null}) {
    return _then(
      _$TransactionsLoadRequestedImpl(
        accountId: null == accountId
            ? _value.accountId
            : accountId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TransactionsLoadRequestedImpl implements TransactionsLoadRequested {
  const _$TransactionsLoadRequestedImpl({required this.accountId});

  @override
  final String accountId;

  @override
  String toString() {
    return 'TransactionsEvent.transactionsLoadRequested(accountId: $accountId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsLoadRequestedImpl &&
            (identical(other.accountId, accountId) || other.accountId == accountId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountId);

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsLoadRequestedImplCopyWith<_$TransactionsLoadRequestedImpl> get copyWith =>
      __$$TransactionsLoadRequestedImplCopyWithImpl<_$TransactionsLoadRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String accountId) transactionsLoadRequested,
    required TResult Function(String accountId, String title, double amount, TransactionType type, String? note) transactionsAddRequested,
    required TResult Function(String transactionId) transactionsDeleteRequested,
    required TResult Function(TransactionFilter filter) transactionsFilterChanged,
    required TResult Function(String query) transactionsSearchChanged,
  }) {
    return transactionsLoadRequested(accountId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String accountId)? transactionsLoadRequested,
    TResult? Function(String accountId, String title, double amount, TransactionType type, String? note)? transactionsAddRequested,
    TResult? Function(String transactionId)? transactionsDeleteRequested,
    TResult? Function(TransactionFilter filter)? transactionsFilterChanged,
    TResult? Function(String query)? transactionsSearchChanged,
  }) {
    return transactionsLoadRequested?.call(accountId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String accountId)? transactionsLoadRequested,
    TResult Function(String accountId, String title, double amount, TransactionType type, String? note)? transactionsAddRequested,
    TResult Function(String transactionId)? transactionsDeleteRequested,
    TResult Function(TransactionFilter filter)? transactionsFilterChanged,
    TResult Function(String query)? transactionsSearchChanged,
    required TResult orElse(),
  }) {
    if (transactionsLoadRequested != null) {
      return transactionsLoadRequested(accountId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionsLoadRequested value) transactionsLoadRequested,
    required TResult Function(TransactionsAddRequested value) transactionsAddRequested,
    required TResult Function(TransactionsDeleteRequested value) transactionsDeleteRequested,
    required TResult Function(TransactionsFilterChanged value) transactionsFilterChanged,
    required TResult Function(TransactionsSearchChanged value) transactionsSearchChanged,
  }) {
    return transactionsLoadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionsLoadRequested value)? transactionsLoadRequested,
    TResult? Function(TransactionsAddRequested value)? transactionsAddRequested,
    TResult? Function(TransactionsDeleteRequested value)? transactionsDeleteRequested,
    TResult? Function(TransactionsFilterChanged value)? transactionsFilterChanged,
    TResult? Function(TransactionsSearchChanged value)? transactionsSearchChanged,
  }) {
    return transactionsLoadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionsLoadRequested value)? transactionsLoadRequested,
    TResult Function(TransactionsAddRequested value)? transactionsAddRequested,
    TResult Function(TransactionsDeleteRequested value)? transactionsDeleteRequested,
    TResult Function(TransactionsFilterChanged value)? transactionsFilterChanged,
    TResult Function(TransactionsSearchChanged value)? transactionsSearchChanged,
    required TResult orElse(),
  }) {
    if (transactionsLoadRequested != null) {
      return transactionsLoadRequested(this);
    }
    return orElse();
  }
}

abstract class TransactionsLoadRequested implements TransactionsEvent {
  const factory TransactionsLoadRequested({required final String accountId}) = _$TransactionsLoadRequestedImpl;

  String get accountId;

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionsLoadRequestedImplCopyWith<_$TransactionsLoadRequestedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionsAddRequestedImplCopyWith<$Res> {
  factory _$$TransactionsAddRequestedImplCopyWith(_$TransactionsAddRequestedImpl value, $Res Function(_$TransactionsAddRequestedImpl) then) =
      __$$TransactionsAddRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String accountId, String title, double amount, TransactionType type, String? note});
}

/// @nodoc
class __$$TransactionsAddRequestedImplCopyWithImpl<$Res> extends _$TransactionsEventCopyWithImpl<$Res, _$TransactionsAddRequestedImpl>
    implements _$$TransactionsAddRequestedImplCopyWith<$Res> {
  __$$TransactionsAddRequestedImplCopyWithImpl(_$TransactionsAddRequestedImpl _value, $Res Function(_$TransactionsAddRequestedImpl) _then)
    : super(_value, _then);

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accountId = null, Object? title = null, Object? amount = null, Object? type = null, Object? note = freezed}) {
    return _then(
      _$TransactionsAddRequestedImpl(
        accountId: null == accountId
            ? _value.accountId
            : accountId // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as TransactionType,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$TransactionsAddRequestedImpl implements TransactionsAddRequested {
  const _$TransactionsAddRequestedImpl({required this.accountId, required this.title, required this.amount, required this.type, this.note});

  @override
  final String accountId;
  @override
  final String title;
  @override
  final double amount;
  @override
  final TransactionType type;
  @override
  final String? note;

  @override
  String toString() {
    return 'TransactionsEvent.transactionsAddRequested(accountId: $accountId, title: $title, amount: $amount, type: $type, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsAddRequestedImpl &&
            (identical(other.accountId, accountId) || other.accountId == accountId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountId, title, amount, type, note);

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsAddRequestedImplCopyWith<_$TransactionsAddRequestedImpl> get copyWith =>
      __$$TransactionsAddRequestedImplCopyWithImpl<_$TransactionsAddRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String accountId) transactionsLoadRequested,
    required TResult Function(String accountId, String title, double amount, TransactionType type, String? note) transactionsAddRequested,
    required TResult Function(String transactionId) transactionsDeleteRequested,
    required TResult Function(TransactionFilter filter) transactionsFilterChanged,
    required TResult Function(String query) transactionsSearchChanged,
  }) {
    return transactionsAddRequested(accountId, title, amount, type, note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String accountId)? transactionsLoadRequested,
    TResult? Function(String accountId, String title, double amount, TransactionType type, String? note)? transactionsAddRequested,
    TResult? Function(String transactionId)? transactionsDeleteRequested,
    TResult? Function(TransactionFilter filter)? transactionsFilterChanged,
    TResult? Function(String query)? transactionsSearchChanged,
  }) {
    return transactionsAddRequested?.call(accountId, title, amount, type, note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String accountId)? transactionsLoadRequested,
    TResult Function(String accountId, String title, double amount, TransactionType type, String? note)? transactionsAddRequested,
    TResult Function(String transactionId)? transactionsDeleteRequested,
    TResult Function(TransactionFilter filter)? transactionsFilterChanged,
    TResult Function(String query)? transactionsSearchChanged,
    required TResult orElse(),
  }) {
    if (transactionsAddRequested != null) {
      return transactionsAddRequested(accountId, title, amount, type, note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionsLoadRequested value) transactionsLoadRequested,
    required TResult Function(TransactionsAddRequested value) transactionsAddRequested,
    required TResult Function(TransactionsDeleteRequested value) transactionsDeleteRequested,
    required TResult Function(TransactionsFilterChanged value) transactionsFilterChanged,
    required TResult Function(TransactionsSearchChanged value) transactionsSearchChanged,
  }) {
    return transactionsAddRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionsLoadRequested value)? transactionsLoadRequested,
    TResult? Function(TransactionsAddRequested value)? transactionsAddRequested,
    TResult? Function(TransactionsDeleteRequested value)? transactionsDeleteRequested,
    TResult? Function(TransactionsFilterChanged value)? transactionsFilterChanged,
    TResult? Function(TransactionsSearchChanged value)? transactionsSearchChanged,
  }) {
    return transactionsAddRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionsLoadRequested value)? transactionsLoadRequested,
    TResult Function(TransactionsAddRequested value)? transactionsAddRequested,
    TResult Function(TransactionsDeleteRequested value)? transactionsDeleteRequested,
    TResult Function(TransactionsFilterChanged value)? transactionsFilterChanged,
    TResult Function(TransactionsSearchChanged value)? transactionsSearchChanged,
    required TResult orElse(),
  }) {
    if (transactionsAddRequested != null) {
      return transactionsAddRequested(this);
    }
    return orElse();
  }
}

abstract class TransactionsAddRequested implements TransactionsEvent {
  const factory TransactionsAddRequested({
    required final String accountId,
    required final String title,
    required final double amount,
    required final TransactionType type,
    final String? note,
  }) = _$TransactionsAddRequestedImpl;

  String get accountId;
  String get title;
  double get amount;
  TransactionType get type;
  String? get note;

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionsAddRequestedImplCopyWith<_$TransactionsAddRequestedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionsDeleteRequestedImplCopyWith<$Res> {
  factory _$$TransactionsDeleteRequestedImplCopyWith(_$TransactionsDeleteRequestedImpl value, $Res Function(_$TransactionsDeleteRequestedImpl) then) =
      __$$TransactionsDeleteRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String transactionId});
}

/// @nodoc
class __$$TransactionsDeleteRequestedImplCopyWithImpl<$Res> extends _$TransactionsEventCopyWithImpl<$Res, _$TransactionsDeleteRequestedImpl>
    implements _$$TransactionsDeleteRequestedImplCopyWith<$Res> {
  __$$TransactionsDeleteRequestedImplCopyWithImpl(_$TransactionsDeleteRequestedImpl _value, $Res Function(_$TransactionsDeleteRequestedImpl) _then)
    : super(_value, _then);

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? transactionId = null}) {
    return _then(
      _$TransactionsDeleteRequestedImpl(
        transactionId: null == transactionId
            ? _value.transactionId
            : transactionId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TransactionsDeleteRequestedImpl implements TransactionsDeleteRequested {
  const _$TransactionsDeleteRequestedImpl({required this.transactionId});

  @override
  final String transactionId;

  @override
  String toString() {
    return 'TransactionsEvent.transactionsDeleteRequested(transactionId: $transactionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsDeleteRequestedImpl &&
            (identical(other.transactionId, transactionId) || other.transactionId == transactionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactionId);

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsDeleteRequestedImplCopyWith<_$TransactionsDeleteRequestedImpl> get copyWith =>
      __$$TransactionsDeleteRequestedImplCopyWithImpl<_$TransactionsDeleteRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String accountId) transactionsLoadRequested,
    required TResult Function(String accountId, String title, double amount, TransactionType type, String? note) transactionsAddRequested,
    required TResult Function(String transactionId) transactionsDeleteRequested,
    required TResult Function(TransactionFilter filter) transactionsFilterChanged,
    required TResult Function(String query) transactionsSearchChanged,
  }) {
    return transactionsDeleteRequested(transactionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String accountId)? transactionsLoadRequested,
    TResult? Function(String accountId, String title, double amount, TransactionType type, String? note)? transactionsAddRequested,
    TResult? Function(String transactionId)? transactionsDeleteRequested,
    TResult? Function(TransactionFilter filter)? transactionsFilterChanged,
    TResult? Function(String query)? transactionsSearchChanged,
  }) {
    return transactionsDeleteRequested?.call(transactionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String accountId)? transactionsLoadRequested,
    TResult Function(String accountId, String title, double amount, TransactionType type, String? note)? transactionsAddRequested,
    TResult Function(String transactionId)? transactionsDeleteRequested,
    TResult Function(TransactionFilter filter)? transactionsFilterChanged,
    TResult Function(String query)? transactionsSearchChanged,
    required TResult orElse(),
  }) {
    if (transactionsDeleteRequested != null) {
      return transactionsDeleteRequested(transactionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionsLoadRequested value) transactionsLoadRequested,
    required TResult Function(TransactionsAddRequested value) transactionsAddRequested,
    required TResult Function(TransactionsDeleteRequested value) transactionsDeleteRequested,
    required TResult Function(TransactionsFilterChanged value) transactionsFilterChanged,
    required TResult Function(TransactionsSearchChanged value) transactionsSearchChanged,
  }) {
    return transactionsDeleteRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionsLoadRequested value)? transactionsLoadRequested,
    TResult? Function(TransactionsAddRequested value)? transactionsAddRequested,
    TResult? Function(TransactionsDeleteRequested value)? transactionsDeleteRequested,
    TResult? Function(TransactionsFilterChanged value)? transactionsFilterChanged,
    TResult? Function(TransactionsSearchChanged value)? transactionsSearchChanged,
  }) {
    return transactionsDeleteRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionsLoadRequested value)? transactionsLoadRequested,
    TResult Function(TransactionsAddRequested value)? transactionsAddRequested,
    TResult Function(TransactionsDeleteRequested value)? transactionsDeleteRequested,
    TResult Function(TransactionsFilterChanged value)? transactionsFilterChanged,
    TResult Function(TransactionsSearchChanged value)? transactionsSearchChanged,
    required TResult orElse(),
  }) {
    if (transactionsDeleteRequested != null) {
      return transactionsDeleteRequested(this);
    }
    return orElse();
  }
}

abstract class TransactionsDeleteRequested implements TransactionsEvent {
  const factory TransactionsDeleteRequested({required final String transactionId}) = _$TransactionsDeleteRequestedImpl;

  String get transactionId;

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionsDeleteRequestedImplCopyWith<_$TransactionsDeleteRequestedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionsFilterChangedImplCopyWith<$Res> {
  factory _$$TransactionsFilterChangedImplCopyWith(_$TransactionsFilterChangedImpl value, $Res Function(_$TransactionsFilterChangedImpl) then) =
      __$$TransactionsFilterChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionFilter filter});
}

/// @nodoc
class __$$TransactionsFilterChangedImplCopyWithImpl<$Res> extends _$TransactionsEventCopyWithImpl<$Res, _$TransactionsFilterChangedImpl>
    implements _$$TransactionsFilterChangedImplCopyWith<$Res> {
  __$$TransactionsFilterChangedImplCopyWithImpl(_$TransactionsFilterChangedImpl _value, $Res Function(_$TransactionsFilterChangedImpl) _then)
    : super(_value, _then);

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? filter = null}) {
    return _then(
      _$TransactionsFilterChangedImpl(
        filter: null == filter
            ? _value.filter
            : filter // ignore: cast_nullable_to_non_nullable
                  as TransactionFilter,
      ),
    );
  }
}

/// @nodoc

class _$TransactionsFilterChangedImpl implements TransactionsFilterChanged {
  const _$TransactionsFilterChangedImpl({required this.filter});

  @override
  final TransactionFilter filter;

  @override
  String toString() {
    return 'TransactionsEvent.transactionsFilterChanged(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TransactionsFilterChangedImpl && (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsFilterChangedImplCopyWith<_$TransactionsFilterChangedImpl> get copyWith =>
      __$$TransactionsFilterChangedImplCopyWithImpl<_$TransactionsFilterChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String accountId) transactionsLoadRequested,
    required TResult Function(String accountId, String title, double amount, TransactionType type, String? note) transactionsAddRequested,
    required TResult Function(String transactionId) transactionsDeleteRequested,
    required TResult Function(TransactionFilter filter) transactionsFilterChanged,
    required TResult Function(String query) transactionsSearchChanged,
  }) {
    return transactionsFilterChanged(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String accountId)? transactionsLoadRequested,
    TResult? Function(String accountId, String title, double amount, TransactionType type, String? note)? transactionsAddRequested,
    TResult? Function(String transactionId)? transactionsDeleteRequested,
    TResult? Function(TransactionFilter filter)? transactionsFilterChanged,
    TResult? Function(String query)? transactionsSearchChanged,
  }) {
    return transactionsFilterChanged?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String accountId)? transactionsLoadRequested,
    TResult Function(String accountId, String title, double amount, TransactionType type, String? note)? transactionsAddRequested,
    TResult Function(String transactionId)? transactionsDeleteRequested,
    TResult Function(TransactionFilter filter)? transactionsFilterChanged,
    TResult Function(String query)? transactionsSearchChanged,
    required TResult orElse(),
  }) {
    if (transactionsFilterChanged != null) {
      return transactionsFilterChanged(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionsLoadRequested value) transactionsLoadRequested,
    required TResult Function(TransactionsAddRequested value) transactionsAddRequested,
    required TResult Function(TransactionsDeleteRequested value) transactionsDeleteRequested,
    required TResult Function(TransactionsFilterChanged value) transactionsFilterChanged,
    required TResult Function(TransactionsSearchChanged value) transactionsSearchChanged,
  }) {
    return transactionsFilterChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionsLoadRequested value)? transactionsLoadRequested,
    TResult? Function(TransactionsAddRequested value)? transactionsAddRequested,
    TResult? Function(TransactionsDeleteRequested value)? transactionsDeleteRequested,
    TResult? Function(TransactionsFilterChanged value)? transactionsFilterChanged,
    TResult? Function(TransactionsSearchChanged value)? transactionsSearchChanged,
  }) {
    return transactionsFilterChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionsLoadRequested value)? transactionsLoadRequested,
    TResult Function(TransactionsAddRequested value)? transactionsAddRequested,
    TResult Function(TransactionsDeleteRequested value)? transactionsDeleteRequested,
    TResult Function(TransactionsFilterChanged value)? transactionsFilterChanged,
    TResult Function(TransactionsSearchChanged value)? transactionsSearchChanged,
    required TResult orElse(),
  }) {
    if (transactionsFilterChanged != null) {
      return transactionsFilterChanged(this);
    }
    return orElse();
  }
}

abstract class TransactionsFilterChanged implements TransactionsEvent {
  const factory TransactionsFilterChanged({required final TransactionFilter filter}) = _$TransactionsFilterChangedImpl;

  TransactionFilter get filter;

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionsFilterChangedImplCopyWith<_$TransactionsFilterChangedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionsSearchChangedImplCopyWith<$Res> {
  factory _$$TransactionsSearchChangedImplCopyWith(_$TransactionsSearchChangedImpl value, $Res Function(_$TransactionsSearchChangedImpl) then) =
      __$$TransactionsSearchChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$TransactionsSearchChangedImplCopyWithImpl<$Res> extends _$TransactionsEventCopyWithImpl<$Res, _$TransactionsSearchChangedImpl>
    implements _$$TransactionsSearchChangedImplCopyWith<$Res> {
  __$$TransactionsSearchChangedImplCopyWithImpl(_$TransactionsSearchChangedImpl _value, $Res Function(_$TransactionsSearchChangedImpl) _then)
    : super(_value, _then);

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? query = null}) {
    return _then(
      _$TransactionsSearchChangedImpl(
        query: null == query
            ? _value.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TransactionsSearchChangedImpl implements TransactionsSearchChanged {
  const _$TransactionsSearchChangedImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'TransactionsEvent.transactionsSearchChanged(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TransactionsSearchChangedImpl && (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsSearchChangedImplCopyWith<_$TransactionsSearchChangedImpl> get copyWith =>
      __$$TransactionsSearchChangedImplCopyWithImpl<_$TransactionsSearchChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String accountId) transactionsLoadRequested,
    required TResult Function(String accountId, String title, double amount, TransactionType type, String? note) transactionsAddRequested,
    required TResult Function(String transactionId) transactionsDeleteRequested,
    required TResult Function(TransactionFilter filter) transactionsFilterChanged,
    required TResult Function(String query) transactionsSearchChanged,
  }) {
    return transactionsSearchChanged(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String accountId)? transactionsLoadRequested,
    TResult? Function(String accountId, String title, double amount, TransactionType type, String? note)? transactionsAddRequested,
    TResult? Function(String transactionId)? transactionsDeleteRequested,
    TResult? Function(TransactionFilter filter)? transactionsFilterChanged,
    TResult? Function(String query)? transactionsSearchChanged,
  }) {
    return transactionsSearchChanged?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String accountId)? transactionsLoadRequested,
    TResult Function(String accountId, String title, double amount, TransactionType type, String? note)? transactionsAddRequested,
    TResult Function(String transactionId)? transactionsDeleteRequested,
    TResult Function(TransactionFilter filter)? transactionsFilterChanged,
    TResult Function(String query)? transactionsSearchChanged,
    required TResult orElse(),
  }) {
    if (transactionsSearchChanged != null) {
      return transactionsSearchChanged(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionsLoadRequested value) transactionsLoadRequested,
    required TResult Function(TransactionsAddRequested value) transactionsAddRequested,
    required TResult Function(TransactionsDeleteRequested value) transactionsDeleteRequested,
    required TResult Function(TransactionsFilterChanged value) transactionsFilterChanged,
    required TResult Function(TransactionsSearchChanged value) transactionsSearchChanged,
  }) {
    return transactionsSearchChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionsLoadRequested value)? transactionsLoadRequested,
    TResult? Function(TransactionsAddRequested value)? transactionsAddRequested,
    TResult? Function(TransactionsDeleteRequested value)? transactionsDeleteRequested,
    TResult? Function(TransactionsFilterChanged value)? transactionsFilterChanged,
    TResult? Function(TransactionsSearchChanged value)? transactionsSearchChanged,
  }) {
    return transactionsSearchChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionsLoadRequested value)? transactionsLoadRequested,
    TResult Function(TransactionsAddRequested value)? transactionsAddRequested,
    TResult Function(TransactionsDeleteRequested value)? transactionsDeleteRequested,
    TResult Function(TransactionsFilterChanged value)? transactionsFilterChanged,
    TResult Function(TransactionsSearchChanged value)? transactionsSearchChanged,
    required TResult orElse(),
  }) {
    if (transactionsSearchChanged != null) {
      return transactionsSearchChanged(this);
    }
    return orElse();
  }
}

abstract class TransactionsSearchChanged implements TransactionsEvent {
  const factory TransactionsSearchChanged({required final String query}) = _$TransactionsSearchChangedImpl;

  String get query;

  /// Create a copy of TransactionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionsSearchChangedImplCopyWith<_$TransactionsSearchChangedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransactionsState {
  TransactionsStatus get status => throw _privateConstructorUsedError;
  List<Transaction> get transactions => throw _privateConstructorUsedError;
  AccountSummary? get summary => throw _privateConstructorUsedError;
  TransactionFilter get activeFilter => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  bool get operationLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionsStateCopyWith<TransactionsState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsStateCopyWith<$Res> {
  factory $TransactionsStateCopyWith(TransactionsState value, $Res Function(TransactionsState) then) =
      _$TransactionsStateCopyWithImpl<$Res, TransactionsState>;
  @useResult
  $Res call({
    TransactionsStatus status,
    List<Transaction> transactions,
    AccountSummary? summary,
    TransactionFilter activeFilter,
    String searchQuery,
    bool operationLoading,
    String error,
  });
}

/// @nodoc
class _$TransactionsStateCopyWithImpl<$Res, $Val extends TransactionsState> implements $TransactionsStateCopyWith<$Res> {
  _$TransactionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? transactions = null,
    Object? summary = freezed,
    Object? activeFilter = null,
    Object? searchQuery = null,
    Object? operationLoading = null,
    Object? error = null,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as TransactionsStatus,
            transactions: null == transactions
                ? _value.transactions
                : transactions // ignore: cast_nullable_to_non_nullable
                      as List<Transaction>,
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as AccountSummary?,
            activeFilter: null == activeFilter
                ? _value.activeFilter
                : activeFilter // ignore: cast_nullable_to_non_nullable
                      as TransactionFilter,
            searchQuery: null == searchQuery
                ? _value.searchQuery
                : searchQuery // ignore: cast_nullable_to_non_nullable
                      as String,
            operationLoading: null == operationLoading
                ? _value.operationLoading
                : operationLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$TransactionsStateImplCopyWith<$Res> implements $TransactionsStateCopyWith<$Res> {
  factory _$$TransactionsStateImplCopyWith(_$TransactionsStateImpl value, $Res Function(_$TransactionsStateImpl) then) =
      __$$TransactionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TransactionsStatus status,
    List<Transaction> transactions,
    AccountSummary? summary,
    TransactionFilter activeFilter,
    String searchQuery,
    bool operationLoading,
    String error,
  });
}

/// @nodoc
class __$$TransactionsStateImplCopyWithImpl<$Res> extends _$TransactionsStateCopyWithImpl<$Res, _$TransactionsStateImpl>
    implements _$$TransactionsStateImplCopyWith<$Res> {
  __$$TransactionsStateImplCopyWithImpl(_$TransactionsStateImpl _value, $Res Function(_$TransactionsStateImpl) _then) : super(_value, _then);

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? transactions = null,
    Object? summary = freezed,
    Object? activeFilter = null,
    Object? searchQuery = null,
    Object? operationLoading = null,
    Object? error = null,
  }) {
    return _then(
      _$TransactionsStateImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TransactionsStatus,
        transactions: null == transactions
            ? _value._transactions
            : transactions // ignore: cast_nullable_to_non_nullable
                  as List<Transaction>,
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as AccountSummary?,
        activeFilter: null == activeFilter
            ? _value.activeFilter
            : activeFilter // ignore: cast_nullable_to_non_nullable
                  as TransactionFilter,
        searchQuery: null == searchQuery
            ? _value.searchQuery
            : searchQuery // ignore: cast_nullable_to_non_nullable
                  as String,
        operationLoading: null == operationLoading
            ? _value.operationLoading
            : operationLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TransactionsStateImpl extends _TransactionsState {
  const _$TransactionsStateImpl({
    this.status = TransactionsStatus.initial,
    final List<Transaction> transactions = const [],
    this.summary,
    this.activeFilter = TransactionFilter.all,
    this.searchQuery = '',
    this.operationLoading = false,
    this.error = '',
  }) : _transactions = transactions,
       super._();

  @override
  @JsonKey()
  final TransactionsStatus status;
  final List<Transaction> _transactions;
  @override
  @JsonKey()
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final AccountSummary? summary;
  @override
  @JsonKey()
  final TransactionFilter activeFilter;
  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final bool operationLoading;
  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'TransactionsState(status: $status, transactions: $transactions, summary: $summary, activeFilter: $activeFilter, searchQuery: $searchQuery, operationLoading: $operationLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._transactions, _transactions) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.activeFilter, activeFilter) || other.activeFilter == activeFilter) &&
            (identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery) &&
            (identical(other.operationLoading, operationLoading) || other.operationLoading == operationLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_transactions),
    summary,
    activeFilter,
    searchQuery,
    operationLoading,
    error,
  );

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsStateImplCopyWith<_$TransactionsStateImpl> get copyWith =>
      __$$TransactionsStateImplCopyWithImpl<_$TransactionsStateImpl>(this, _$identity);
}

abstract class _TransactionsState extends TransactionsState {
  const factory _TransactionsState({
    final TransactionsStatus status,
    final List<Transaction> transactions,
    final AccountSummary? summary,
    final TransactionFilter activeFilter,
    final String searchQuery,
    final bool operationLoading,
    final String error,
  }) = _$TransactionsStateImpl;
  const _TransactionsState._() : super._();

  @override
  TransactionsStatus get status;
  @override
  List<Transaction> get transactions;
  @override
  AccountSummary? get summary;
  @override
  TransactionFilter get activeFilter;
  @override
  String get searchQuery;
  @override
  bool get operationLoading;
  @override
  String get error;

  /// Create a copy of TransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionsStateImplCopyWith<_$TransactionsStateImpl> get copyWith => throw _privateConstructorUsedError;
}
