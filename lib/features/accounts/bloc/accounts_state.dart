part of 'accounts_bloc.dart';

@freezed
class AccountsState with _$AccountsState {
  const factory AccountsState({
    @Default(AccountsStatus.initial) AccountsStatus status,

    @Default([]) List<Account> accounts,
    @Default({}) Map<String, AccountSummary> summaries,

    @Default('') String error,
  }) = _AccountsState;
}

enum AccountsStatus { initial, loading, success, error }
