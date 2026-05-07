import 'package:flutter/material.dart';
import '../../features/auth/screens/auth_screen.dart';
import '../../features/accounts/screens/accounts_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/transactions/screens/transactions_screen.dart';
import '../../models/models.dart';

/// Named route constants — single source of truth.
abstract class AppRoutes {
  static const auth         = '/auth';
  static const accounts     = '/accounts';
  static const transactions = '/transactions';
  static const profile      = '/profile';
}

/// Route generator for Navigator 1.0 (MaterialApp.onGenerateRoute).
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.auth:
      return _slide(const AuthScreen());

    case AppRoutes.accounts:
      return _slide(const AccountsScreen());

    case AppRoutes.transactions:
      final account = settings.arguments as Account;
      return _slide(TransactionsScreen(account: account));

    case AppRoutes.profile:
      return _slide(const ProfileScreen());

    default:
      return _slide(const AuthScreen());
  }
}

/// Slide-from-right page transition helper.
PageRouteBuilder<T> _slide<T>(Widget page) => PageRouteBuilder<T>(
  settings: RouteSettings(name: null),
  pageBuilder: (_, __, ___) => page,
  transitionsBuilder: (_, animation, __, child) {
    const begin = Offset(1.0, 0.0);
    const end   = Offset.zero;
    const curve = Curves.easeInOutCubic;
    return SlideTransition(
      position: Tween(begin: begin, end: end).animate(CurvedAnimation(parent: animation, curve: curve)),
      child: child,
    );
  },
  transitionDuration: const Duration(milliseconds: 280),
);