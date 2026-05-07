// ─── Account ──────────────────────────────────────────────────
class Account {
  final String id;
  final String userId;
  final String name;
  final int colorIndex;
  final DateTime createdAt;

  const Account({required this.id, required this.userId, required this.name, this.colorIndex = 0, required this.createdAt});

  factory Account.empty() => Account(id: '', userId: '', name: '', colorIndex: 0, createdAt: DateTime.fromMillisecondsSinceEpoch(0));

  factory Account.fromJson(Map<String, dynamic> json) => Account(
    id: json['id'] as String,
    userId: json['user_id'] as String,
    name: json['name'] as String,
    colorIndex: (json['color_index'] as int?) ?? 0,
    createdAt: DateTime.parse(json['created_at'] as String),
  );

  Account copyWith({String? id, String? userId, String? name, int? colorIndex, DateTime? createdAt}) {
    return Account(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      colorIndex: colorIndex ?? this.colorIndex,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) => other is Account && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

// ─── TransactionType ──────────────────────────────────────────
enum TransactionType { checkIn, checkOut }

extension TransactionTypeX on TransactionType {
  String get label => this == TransactionType.checkIn ? 'Check-In' : 'Check-Out';
  bool get isIncome => this == TransactionType.checkIn;
  String get value => this == TransactionType.checkIn ? 'check_in' : 'check_out';

  static TransactionType fromString(String s) => s == 'check_in' ? TransactionType.checkIn : TransactionType.checkOut;
}

// ─── Transaction ──────────────────────────────────────────────
class Transaction {
  final String id;
  final String accountId;
  final String userId;
  final String title;
  final double amount;
  final TransactionType type;
  final String? note;
  final DateTime createdAt;

  const Transaction({
    required this.id,
    required this.accountId,
    required this.userId,
    required this.title,
    required this.amount,
    required this.type,
    this.note,
    required this.createdAt,
  });

  bool get isIncome => type.isIncome;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json['id'] as String,
    accountId: json['account_id'] as String,
    userId: json['user_id'] as String,
    title: json['title'] as String,
    amount: (json['amount'] as num).toDouble(),
    type: TransactionTypeX.fromString(json['type'] as String),
    note: json['note'] as String?,
    createdAt: DateTime.parse(json['created_at'] as String),
  );

  Transaction copyWith({
    String? id,
    String? accountId,
    String? userId,
    String? title,
    double? amount,
    TransactionType? type,
    String? note,
    DateTime? createdAt,
  }) {
    return Transaction(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) => other is Transaction && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

// ─── AccountSummary ───────────────────────────────────────────
class AccountSummary {
  final Account account;
  final double totalIn;
  final double totalOut;

  const AccountSummary({required this.account, this.totalIn = 0, this.totalOut = 0});

  double get balance => totalIn - totalOut;

  AccountSummary copyWith({Account? account, double? totalIn, double? totalOut}) {
    return AccountSummary(account: account ?? this.account, totalIn: totalIn ?? this.totalIn, totalOut: totalOut ?? this.totalOut);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountSummary &&
          runtimeType == other.runtimeType &&
          account == other.account &&
          totalIn == other.totalIn &&
          totalOut == other.totalOut;

  @override
  int get hashCode => Object.hash(account, totalIn, totalOut);
}

// ─── TransactionFilter ────────────────────────────────────────
enum TransactionFilter { all, today, weekly, monthly, yearly }

extension TransactionFilterX on TransactionFilter {
  String get label => switch (this) {
    TransactionFilter.all => 'All',
    TransactionFilter.today => 'Today',
    TransactionFilter.weekly => 'Weekly',
    TransactionFilter.monthly => 'Monthly',
    TransactionFilter.yearly => 'Yearly',
  };

  bool matches(DateTime date) {
    final now = DateTime.now();
    return switch (this) {
      TransactionFilter.all => true,
      TransactionFilter.today => date.year == now.year && date.month == now.month && date.day == now.day,
      TransactionFilter.weekly => date.isAfter(now.subtract(const Duration(days: 7))),
      TransactionFilter.monthly => date.year == now.year && date.month == now.month,
      TransactionFilter.yearly => date.year == now.year,
    };
  }
}
