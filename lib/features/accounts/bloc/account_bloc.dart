import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/models.dart';
import '../../../services/supabase_service.dart';

// ─── Events ───────────────────────────────────────────────────
abstract class AccountsEvent extends Equatable {
  const AccountsEvent();
  @override List<Object?> get props => [];
}

class AccountsLoadRequested extends AccountsEvent {
  const AccountsLoadRequested();
}

class AccountsCreateRequested extends AccountsEvent {
  final String name;
  final int colorIndex;
  const AccountsCreateRequested({required this.name, required this.colorIndex});
  @override List<Object?> get props => [name, colorIndex];
}

class AccountsDeleteRequested extends AccountsEvent {
  final String accountId;
  const AccountsDeleteRequested(this.accountId);
  @override List<Object?> get props => [accountId];
}

class AccountsSummaryLoadRequested extends AccountsEvent {
  final Account account;
  const AccountsSummaryLoadRequested(this.account);
  @override List<Object?> get props => [account];
}

// ─── States ───────────────────────────────────────────────────
abstract class AccountsState extends Equatable {
  const AccountsState();
  @override List<Object?> get props => [];
}

class AccountsInitial extends AccountsState {
  const AccountsInitial();
}

class AccountsLoading extends AccountsState {
  const AccountsLoading();
}

class AccountsLoaded extends AccountsState {
  final List<Account> accounts;
  final Map<String, AccountSummary> summaries;

  const AccountsLoaded({required this.accounts, this.summaries = const {}});

  AccountsLoaded copyWith({List<Account>? accounts, Map<String, AccountSummary>? summaries}) =>
      AccountsLoaded(accounts: accounts ?? this.accounts, summaries: summaries ?? this.summaries);

  @override List<Object?> get props => [accounts, summaries];
}

class AccountsFailure extends AccountsState {
  final String message;
  const AccountsFailure(this.message);
  @override List<Object?> get props => [message];
}

class AccountsOperationLoading extends AccountsState {
  final AccountsLoaded current;
  const AccountsOperationLoading(this.current);
  @override List<Object?> get props => [current];
}

// ─── BLoC ─────────────────────────────────────────────────────
class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  AccountsBloc() : super(const AccountsInitial()) {
    on<AccountsLoadRequested>(_onLoad);
    on<AccountsCreateRequested>(_onCreate);
    on<AccountsDeleteRequested>(_onDelete);
    on<AccountsSummaryLoadRequested>(_onSummaryLoad);
  }

  Future<void> _onLoad(AccountsLoadRequested e, Emitter<AccountsState> emit) async {
    emit(const AccountsLoading());
    try {
      final accounts = await SupabaseService.fetchAccounts();
      final loaded = AccountsLoaded(accounts: accounts);
      emit(loaded);
      // Load summaries for all accounts in background
      for (final acc in accounts) {
        add(AccountsSummaryLoadRequested(acc));
      }
    } catch (err) {
      emit(AccountsFailure(err.toString()));
    }
  }

  Future<void> _onCreate(AccountsCreateRequested e, Emitter<AccountsState> emit) async {
    final current = state is AccountsLoaded ? state as AccountsLoaded : const AccountsLoaded(accounts: []);
    emit(AccountsOperationLoading(current));
    try {
      await SupabaseService.createAccount(name: e.name, colorIndex: e.colorIndex);
      add(const AccountsLoadRequested());
    } catch (err) {
      emit(AccountsFailure(err.toString()));
    }
  }

  Future<void> _onDelete(AccountsDeleteRequested e, Emitter<AccountsState> emit) async {
    final current = state is AccountsLoaded ? state as AccountsLoaded : const AccountsLoaded(accounts: []);
    emit(AccountsOperationLoading(current));
    try {
      await SupabaseService.deleteAccount(e.accountId);
      add(const AccountsLoadRequested());
    } catch (err) {
      emit(AccountsFailure(err.toString()));
    }
  }

  Future<void> _onSummaryLoad(AccountsSummaryLoadRequested e, Emitter<AccountsState> emit) async {
    if (state is! AccountsLoaded) return;
    try {
      final summary = await SupabaseService.fetchAccountSummary(e.account);
      if (state is AccountsLoaded) {
        final current = state as AccountsLoaded;
        final updated = Map<String, AccountSummary>.from(current.summaries);
        updated[e.account.id] = summary;
        emit(current.copyWith(summaries: updated));
      }
    } catch (_) {}
  }
}