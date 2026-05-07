import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/accounts/bloc/accounts_bloc.dart';
import 'features/auth/bloc/auth_bloc.dart';
import 'features/transactions/bloc/transactions_bloc.dart';
import 'services/supabase_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load .env file
  await dotenv.load(fileName: ".env");

  final supabaseUrl = dotenv.env['SUPABASE_URL'];
  final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];

  if (supabaseUrl == null || supabaseAnonKey == null) {
    throw Exception("Supabase URL or ANON_KEY is not set in .env");
  }

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  runApp(const FinanceTrackerApp());
}

class FinanceTrackerApp extends StatelessWidget {
  const FinanceTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = SupabaseService.currentUser != null;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()..add(const AuthEvent.checkAuth())),
        BlocProvider(create: (_) => AccountsBloc()),
        BlocProvider(create: (_) => TransactionsBloc()),
      ],
      child: MaterialApp(
        title: 'Finance Tracker',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        initialRoute: isLoggedIn ? AppRoutes.accounts : AppRoutes.auth,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
