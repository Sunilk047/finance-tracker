import 'package:intl/intl.dart';

abstract class AppFormatters {
  static final _currency = NumberFormat.currency(symbol: '₹', decimalDigits: 2);
  static final _date     = DateFormat('MMM d, yyyy');
  static final _time     = DateFormat('h:mm a');
  static final _full     = DateFormat('MMM d, yyyy · h:mm a');

  static String currency(double amount) => _currency.format(amount);
  static String date(DateTime dt)       => _date.format(dt);
  static String time(DateTime dt)       => _time.format(dt);
  static String full(DateTime dt)       => _full.format(dt);

  static String relativeDate(DateTime dt) {
    final now   = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final d     = DateTime(dt.year, dt.month, dt.day);
    final diff  = today.difference(d).inDays;
    if (diff == 0) return 'Today';
    if (diff == 1) return 'Yesterday';
    return _date.format(dt);
  }
}