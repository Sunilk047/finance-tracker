import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/accounts/bloc/account_bloc.dart';
import 'features/auth/bloc/auth_bloc.dart';
import 'features/transactions/bloc/transaction_bloc.dart';
import 'services/supabase_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://qluwcrdguizlatyslein.supabase.co',
    anonKey: 'sb_publishable_Fddhu6EXZFQ1YgXZUbG_LA_WtFafOfu',
  );

  runApp(const FinanceTrackerApp());
}

class FinanceTrackerApp extends StatelessWidget {
  const FinanceTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = SupabaseService.currentUser != null;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()..add(const AuthCheckRequested())),
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