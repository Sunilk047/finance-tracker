part of 'accounts_bloc.dart';

@freezed
class AccountsEvent with _$AccountsEvent {
  const factory AccountsEvent.accountsLoadRequested() = _AccountsLoadRequested;
  const factory AccountsEvent.accountsCreateRequested({required String name, required int colorIndex}) = _AccountsCreateRequested;
  const factory AccountsEvent.accountsDeleteRequested({required String accountId}) = _AccountsDeleteRequested;
  const factory AccountsEvent.accountsSummaryLoadRequested({required Account account}) = _AccountsSummaryLoadRequested;
}
