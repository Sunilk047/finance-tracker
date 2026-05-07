part of 'transactions_bloc.dart';

@freezed
class TransactionsEvent with _$TransactionsEvent {
  const factory TransactionsEvent.transactionsLoadRequested({required String accountId}) = TransactionsLoadRequested;
  const factory TransactionsEvent.transactionsAddRequested({
    required String accountId,
    required String title,
    required double amount,
    required TransactionType type,
    String? note,
  }) = TransactionsAddRequested;
  const factory TransactionsEvent.transactionsDeleteRequested({required String transactionId}) = TransactionsDeleteRequested;
  const factory TransactionsEvent.transactionsFilterChanged({required TransactionFilter filter}) = TransactionsFilterChanged;
  const factory TransactionsEvent.transactionsSearchChanged({required String query}) = TransactionsSearchChanged;
}
