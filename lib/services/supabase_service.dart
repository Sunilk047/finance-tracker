import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';

class SupabaseService {
  SupabaseService._();
  static final _client = Supabase.instance.client;

  // ── Auth ──────────────────────────────────────────────────────
  static User? get currentUser => _client.auth.currentUser;
  static Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;

  static Future<AuthResponse> signUp({required String email, required String password}) => _client.auth.signUp(email: email, password: password);

  static Future<AuthResponse> signIn({required String email, required String password}) =>
      _client.auth.signInWithPassword(email: email, password: password);

  static Future<void> signOut() => _client.auth.signOut();

  // ── Accounts ──────────────────────────────────────────────────
  static Future<List<Account>> fetchAccounts() async {
    final data = await _client.from('accounts').select().eq('user_id', currentUser!.id).order('created_at');
    return (data as List).map((e) => Account.fromJson(e)).toList();
  }

  static Future<Account> createAccount({required String name, required int colorIndex}) async {
    final data = await _client.from('accounts').insert({'user_id': currentUser!.id, 'name': name, 'color_index': colorIndex}).select().single();
    return Account.fromJson(data);
  }

  static Future<void> updateAccount(Account account) async {
    await _client.from('accounts').update({'name': account.name, 'color_index': account.colorIndex}).eq('id', account.id);
  }

  static Future<void> deleteAccount(String accountId) async {
    await _client.from('accounts').delete().eq('id', accountId);
  }

  // ── Transactions ──────────────────────────────────────────────
  static Future<List<Transaction>> fetchTransactions(String accountId) async {
    final data = await _client.from('transactions').select().eq('account_id', accountId).order('created_at', ascending: false);
    return (data as List).map((e) => Transaction.fromJson(e)).toList();
  }

  static Future<Transaction> createTransaction({
    required String accountId,
    required String title,
    required double amount,
    required TransactionType type,
    String? note,
  }) async {
    final data = await _client
        .from('transactions')
        .insert({'account_id': accountId, 'user_id': currentUser!.id, 'title': title, 'amount': amount, 'type': type.value, 'note': note})
        .select()
        .single();
    print("TXN ADD -=====$data");
    return Transaction.fromJson(data);
  }

  static Future<void> deleteTransaction(String id) async {
    await _client.from('transactions').delete().eq('id', id);
  }

  static Future<AccountSummary> fetchAccountSummary(Account account) async {
    final txList = await fetchTransactions(account.id);
    double totalIn = 0, totalOut = 0;
    for (final t in txList) {
      if (t.isIncome) {
        totalIn += t.amount;
      } else {
        totalOut += t.amount;
      }
    }
    return AccountSummary(account: account, totalIn: totalIn, totalOut: totalOut);
  }
}
