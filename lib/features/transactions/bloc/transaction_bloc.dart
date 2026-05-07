import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/models.dart';
import '../../../services/supabase_service.dart';

// ─── Events ───────────────────────────────────────────────────
abstract class TransactionsEvent extends Equatable {
  const TransactionsEvent();
  @override List<Object?> get props => [];
}

class TransactionsLoadRequested extends TransactionsEvent {
  final String accountId;
  const TransactionsLoadRequested(this.accountId);
  @override List<Object?> get props => [accountId];
}

class TransactionsAddRequested extends TransactionsEvent {
  final String accountId;
  final String title;
  final double amount;
  final TransactionType type;
  final String? note;
  const TransactionsAddRequested({required this.accountId, required this.title, required this.amount, required this.type, this.note});
  @override List<Object?> get props => [accountId, title, amount, type, note];
}

class TransactionsDeleteRequested extends TransactionsEvent {
  final String transactionId;
  const TransactionsDeleteRequested(this.transactionId);
  @override List<Object?> get props => [transactionId];
}

class TransactionsFilterChanged extends TransactionsEvent {
  final TransactionFilter filter;
  const TransactionsFilterChanged(this.filter);
  @override List<Object?> get props => [filter];
}

class TransactionsSearchChanged extends TransactionsEvent {
  final String query;
  const TransactionsSearchChanged(this.query);
  @override List<Object?> get props => [query];
}

// ─── States ───────────────────────────────────────────────────
abstract class TransactionsState extends Equatable {
  const TransactionsState();
  @override List<Object?> get props => [];
}

class TransactionsInitial extends TransactionsState {
  const TransactionsInitial();
}

class TransactionsLoading extends TransactionsState {
  const TransactionsLoading();
}

class TransactionsLoaded extends TransactionsState {
  final List<Transaction> allTransactions;
  final TransactionFilter activeFilter;
  final String searchQuery;
  final AccountSummary summary;
  final bool operationLoading;

  const TransactionsLoaded({
    required this.allTransactions,
    required this.summary,
    this.activeFilter = TransactionFilter.all,
    this.searchQuery = '',
    this.operationLoading = false,
  });

  List<Transaction> get filtered {
    var result = allTransactions.where((t) => activeFilter.matches(t.createdAt)).toList();
    if (searchQuery.isNotEmpty) {
      final q = searchQuery.toLowerCase();
      result = result.where((t) =>
      t.title.toLowerCase().contains(q) ||
          t.amount.toString().contains(q) ||
          (t.note?.toLowerCase().contains(q) ?? false)
      ).toList();
    }
    return result;
  }

  TransactionsLoaded copyWith({
    List<Transaction>? allTransactions,
    TransactionFilter? activeFilter,
    String? searchQuery,
    AccountSummary? summary,
    bool? operationLoading,
  }) => TransactionsLoaded(
    allTransactions: allTransactions ?? this.allTransactions,
    activeFilter: activeFilter ?? this.activeFilter,
    searchQuery: searchQuery ?? this.searchQuery,
    summary: summary ?? this.summary,
    operationLoading: operationLoading ?? this.operationLoading,
  );

  @override List<Object?> get props => [allTransactions, activeFilter, searchQuery, summary, operationLoading];
}

class TransactionsFailure extends TransactionsState {
  final String message;
  const TransactionsFailure(this.message);
  @override List<Object?> get props => [message];
}

class TransactionAdded extends TransactionsState {
  const TransactionAdded();
}

// ─── BLoC ─────────────────────────────────────────────────────
class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc() : super(const TransactionsInitial()) {
    on<TransactionsLoadRequested>(_onLoad);
    on<TransactionsAddRequested>(_onAdd);
    on<TransactionsDeleteRequested>(_onDelete);
    on<TransactionsFilterChanged>(_onFilterChanged);
    on<TransactionsSearchChanged>(_onSearchChanged);
  }

  Future<void> _onLoad(TransactionsLoadRequested e, Emitter<TransactionsState> emit) async {
    emit(const TransactionsLoading());
    try {
      final account = SupabaseService.currentUser != null
          ? await _findAccount(e.accountId)
          : null;
      final txList = await SupabaseService.fetchTransactions(e.accountId);
      double totalIn = 0, totalOut = 0;
      for (final t in txList) { if (t.isIncome) { totalIn += t.amount; } else { totalOut += t.amount; } }
      emit(TransactionsLoaded(
        allTransactions: txList,
        summary: AccountSummary(account: account!, totalIn: totalIn, totalOut: totalOut),
      ));
    } catch (err) {
      emit(TransactionsFailure(err.toString()));
    }
  }

  Future<void> _onAdd(TransactionsAddRequested e, Emitter<TransactionsState> emit) async {
    if (state is! TransactionsLoaded) return;
    final current = state as TransactionsLoaded;
    emit(current.copyWith(operationLoading: true));
    try {
      await SupabaseService.createTransaction(
        accountId: e.accountId, title: e.title,
        amount: e.amount, type: e.type, note: e.note,
      );
      add(TransactionsLoadRequested(e.accountId));
    } catch (err) {
      emit(current.copyWith(operationLoading: false));
      emit(TransactionsFailure(err.toString()));
    }
  }

  Future<void> _onDelete(TransactionsDeleteRequested e, Emitter<TransactionsState> emit) async {
    if (state is! TransactionsLoaded) return;
    final current = state as TransactionsLoaded;
    emit(current.copyWith(operationLoading: true));
    try {
      await SupabaseService.deleteTransaction(e.transactionId);
      final updated = current.allTransactions.where((t) => t.id != e.transactionId).toList();
      double totalIn = 0, totalOut = 0;
      for (final t in updated) { if (t.isIncome) { totalIn += t.amount; } else { totalOut += t.amount; } }
      emit(current.copyWith(
        allTransactions: updated,
        summary: AccountSummary(account: current.summary.account, totalIn: totalIn, totalOut: totalOut),
        operationLoading: false,
      ));
    } catch (err) {
      emit(current.copyWith(operationLoading: false));
    }
  }

  void _onFilterChanged(TransactionsFilterChanged e, Emitter<TransactionsState> emit) {
    if (state is TransactionsLoaded) {
      emit((state as TransactionsLoaded).copyWith(activeFilter: e.filter));
    }
  }

  void _onSearchChanged(TransactionsSearchChanged e, Emitter<TransactionsState> emit) {
    if (state is TransactionsLoaded) {
      emit((state as TransactionsLoaded).copyWith(searchQuery: e.query));
    }
  }

  Future<Account?> _findAccount(String accountId) async {
    final accounts = await SupabaseService.fetchAccounts();
    try { return accounts.firstWhere((a) => a.id == accountId); } catch (_) { return null; }
  }
}