import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/models.dart';
import '../../../services/supabase_service.dart';

part 'accounts_event.dart';
part 'accounts_state.dart';
part 'accounts_bloc.freezed.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  AccountsBloc() : super(const AccountsState()) {
    on<_AccountsLoadRequested>(_onLoad);
    on<_AccountsCreateRequested>(_onCreate);
    on<_AccountsDeleteRequested>(_onDelete);
    on<_AccountsSummaryLoadRequested>(_onSummaryLoad);
  }
  Future<void> _onLoad(_AccountsLoadRequested event, Emitter<AccountsState> emit) async {
    emit(state.copyWith(status: AccountsStatus.loading));
    try {
      final accounts = await SupabaseService.fetchAccounts();
      emit(state.copyWith(status: AccountsStatus.success, accounts: accounts));

      // Load summaries for all accounts in background
      for (final acc in accounts) {
        add(AccountsEvent.accountsSummaryLoadRequested(account: acc));
      }
    } catch (err) {
      emit(state.copyWith(status: AccountsStatus.error, error: err.toString()));
    }
  }

  Future<void> _onCreate(_AccountsCreateRequested event, Emitter<AccountsState> emit) async {
    // final current = state is AccountsLoaded ? state as AccountsLoaded : const AccountsLoaded(accounts: []);
    // emit(AccountsOperationLoading(current));
    // Keep previous data while creating
    final currentAccounts = state.accounts;
    emit(state.copyWith(status: AccountsStatus.loading, accounts: currentAccounts));
    try {
      await SupabaseService.createAccount(name: event.name, colorIndex: event.colorIndex);
      add(const AccountsEvent.accountsLoadRequested());
    } catch (err) {
      emit(state.copyWith(status: AccountsStatus.error, error: err.toString()));
    }
  }

  Future<void> _onDelete(_AccountsDeleteRequested event, Emitter<AccountsState> emit) async {
    // final current = state is AccountsLoaded ? state as AccountsLoaded : const AccountsLoaded(accounts: []);
    // emit(AccountsOperationLoading(current));
    // Keep previous data while deleting
    final currentAccounts = state.accounts;
    emit(state.copyWith(status: AccountsStatus.loading, accounts: currentAccounts));
    try {
      await SupabaseService.deleteAccount(event.accountId);
      add(const AccountsEvent.accountsLoadRequested());
    } catch (err) {
      emit(state.copyWith(status: AccountsStatus.error, error: err.toString()));
    }
  }

  Future<void> _onSummaryLoad(_AccountsSummaryLoadRequested event, Emitter<AccountsState> emit) async {
    if (state.accounts.isEmpty) return;

    try {
      final summary = await SupabaseService.fetchAccountSummary(event.account);

      // Update summaries map
      final updatedSummaries = Map<String, AccountSummary>.from(state.summaries);
      updatedSummaries[event.account.id] = summary;

      emit(state.copyWith(summaries: updatedSummaries));
    } catch (_) {
      // silently fail or optionally log error
    }
  }
}
