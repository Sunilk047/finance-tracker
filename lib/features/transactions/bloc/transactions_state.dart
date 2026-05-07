part of 'transactions_bloc.dart';

enum TransactionsStatus { initial, loading, success, error }

@freezed
class TransactionsState with _$TransactionsState {
  const TransactionsState._(); // needed for custom getters

  const factory TransactionsState({
    @Default(TransactionsStatus.initial) TransactionsStatus status,
    @Default([]) List<Transaction> transactions,
    AccountSummary? summary,
    @Default(TransactionFilter.all) TransactionFilter activeFilter,
    @Default('') String searchQuery,
    @Default(false) bool operationLoading,
    @Default('') String error,
  }) = _TransactionsState;

  factory TransactionsState.initial() => TransactionsState(
    status: TransactionsStatus.initial,
    transactions: [],
    summary: AccountSummary(account: Account.empty()),
    activeFilter: TransactionFilter.all,
    searchQuery: '',
    operationLoading: false,
    error: '',
  );

  // ─── Computed property for filtered transactions ───────
  List<Transaction> get filtered {
    if (transactions.isEmpty) return [];
    var result = transactions.where((t) => activeFilter.matches(t.createdAt)).toList();
    if (searchQuery.isNotEmpty) {
      final q = searchQuery.toLowerCase();
      result = result
          .where((t) => t.title.toLowerCase().contains(q) || t.amount.toString().contains(q) || (t.note?.toLowerCase().contains(q) ?? false))
          .toList();
    }
    return result;
  }
}
