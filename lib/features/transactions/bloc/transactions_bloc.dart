// import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// import '../../../models/models.dart';
// import '../../../services/supabase_service.dart';
//
// part 'transactions_event.dart';
// part 'transactions_state.dart';
// part 'transactions_bloc.freezed.dart';
//
// class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
//   TransactionsBloc() : super(const TransactionsState()) {
//     on<_TransactionsLoadRequested>(_onLoad);
//     on<_TransactionsAddRequested>(_onAdd);
//     on<_TransactionsDeleteRequested>(_onDelete);
//     on<_TransactionsFilterChanged>(_onFilterChanged);
//     on<_TransactionsSearchChanged>(_onSearchChanged);
//   }
//
//   Future<void> _onLoad(_TransactionsLoadRequested event, Emitter<TransactionsState> emit) async {
//     emit(state.copyWith(status: TransactionsStatus.loading, error: ''));
//     try {
//       final account = await _findAccount(event.accountId);
//       final txList = await SupabaseService.fetchTransactions(event.accountId);
//
//       double totalIn = 0, totalOut = 0;
//       for (final t in txList) {
//         if (t.isIncome)
//           totalIn += t.amount;
//         else
//           totalOut += t.amount;
//       }
//
//       emit(
//         state.copyWith(
//           status: TransactionsStatus.success,
//           transactions: txList,
//           summary: AccountSummary(account: account ?? Account.empty(), totalIn: totalIn, totalOut: totalOut),
//         ),
//       );
//     } catch (err) {
//       emit(state.copyWith(status: TransactionsStatus.error, error: err.toString()));
//     }
//   }
//
//   Future<void> _onAdd(_TransactionsAddRequested event, Emitter<TransactionsState> emit) async {
//     if (state.summary == null) return;
//     emit(state.copyWith(operationLoading: true));
//     try {
//       await SupabaseService.createTransaction(
//         accountId: event.accountId,
//         title: event.title,
//         amount: event.amount,
//         type: event.type,
//         note: event.note,
//       );
//       add(TransactionsEvent.transactionsLoadRequested(accountId: event.accountId));
//     } catch (err) {
//       emit(state.copyWith(operationLoading: false, error: err.toString()));
//     }
//   }
//
//   Future<void> _onDelete(_TransactionsDeleteRequested event, Emitter<TransactionsState> emit) async {
//     if (state.summary == null) return;
//     emit(state.copyWith(operationLoading: true));
//     try {
//       await SupabaseService.deleteTransaction(event.transactionId);
//       final updatedTx = state.transactions.where((t) => t.id != event.transactionId).toList();
//
//       double totalIn = 0, totalOut = 0;
//       for (final t in updatedTx) {
//         if (t.isIncome)
//           totalIn += t.amount;
//         else
//           totalOut += t.amount;
//       }
//
//       emit(
//         state.copyWith(
//           transactions: updatedTx,
//           summary: state.summary!.copyWith(totalIn: totalIn, totalOut: totalOut),
//           operationLoading: false,
//         ),
//       );
//     } catch (_) {
//       emit(state.copyWith(operationLoading: false));
//     }
//   }
//
//   void _onFilterChanged(_TransactionsFilterChanged event, Emitter<TransactionsState> emit) {
//     emit(state.copyWith(activeFilter: event.filter));
//   }
//
//   void _onSearchChanged(_TransactionsSearchChanged event, Emitter<TransactionsState> emit) {
//     emit(state.copyWith(searchQuery: event.query));
//   }
//
//   Future<Account?> _findAccount(String accountId) async {
//     try {
//       final accounts = await SupabaseService.fetchAccounts();
//       return accounts.firstWhere((a) => a.id == accountId, orElse: () => Account.empty());
//     } catch (_) {
//       return Account.empty();
//     }
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../models/models.dart';
import '../../../services/supabase_service.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';
part 'transactions_bloc.freezed.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc() : super(TransactionsState.initial()) {
    // ─── Load transactions
    on<TransactionsLoadRequested>((event, emit) async {
      emit(state.copyWith(status: TransactionsStatus.loading, error: ''));
      try {
        final transactions = await SupabaseService.fetchTransactions(event.accountId);

        // Calculate summary
        final totalIn = transactions.where((t) => t.isIncome).fold<double>(0, (sum, t) => sum + t.amount);
        final totalOut = transactions.where((t) => !t.isIncome).fold<double>(0, (sum, t) => sum + t.amount);

        final summary =
            state.summary?.copyWith(totalIn: totalIn, totalOut: totalOut) ??
            AccountSummary(account: Account.empty(), totalIn: totalIn, totalOut: totalOut);

        emit(state.copyWith(status: TransactionsStatus.success, transactions: transactions, summary: summary));
      } catch (e) {
        emit(state.copyWith(status: TransactionsStatus.error, error: e.toString()));
      }
    });

    // ─── Add transaction
    on<TransactionsAddRequested>((event, emit) async {
      emit(state.copyWith(operationLoading: true, error: ''));
      try {
        final newTx = await SupabaseService.createTransaction(
          accountId: event.accountId,
          title: event.title,
          amount: event.amount,
          type: event.type,
          note: event.note,
        );

        final updatedTransactions = List<Transaction>.from(state.transactions)..add(newTx);

        final totalIn = updatedTransactions.where((t) => t.isIncome).fold<double>(0, (sum, t) => sum + t.amount);
        final totalOut = updatedTransactions.where((t) => !t.isIncome).fold<double>(0, (sum, t) => sum + t.amount);

        final updatedSummary = state.summary?.copyWith(totalIn: totalIn, totalOut: totalOut);

        emit(state.copyWith(transactions: updatedTransactions, summary: updatedSummary, operationLoading: false));
      } catch (e) {
        emit(state.copyWith(operationLoading: false, error: e.toString()));
      }
    });

    // ─── Delete transaction
    on<TransactionsDeleteRequested>((event, emit) async {
      emit(state.copyWith(operationLoading: true, error: ''));
      try {
        await SupabaseService.deleteTransaction(event.transactionId);

        final updatedTransactions = state.transactions.where((t) => t.id != event.transactionId).toList();

        final totalIn = updatedTransactions.where((t) => t.isIncome).fold<double>(0, (sum, t) => sum + t.amount);
        final totalOut = updatedTransactions.where((t) => !t.isIncome).fold<double>(0, (sum, t) => sum + t.amount);

        final updatedSummary = state.summary?.copyWith(totalIn: totalIn, totalOut: totalOut);

        emit(state.copyWith(transactions: updatedTransactions, summary: updatedSummary, operationLoading: false));
      } catch (e) {
        emit(state.copyWith(operationLoading: false, error: e.toString()));
      }
    });

    // ─── Filter changed
    on<TransactionsFilterChanged>((event, emit) {
      emit(state.copyWith(activeFilter: event.filter));
    });

    // ─── Search query changed
    on<TransactionsSearchChanged>((event, emit) {
      emit(state.copyWith(searchQuery: event.query));
    });
  }
}
