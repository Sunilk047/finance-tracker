import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_widgets.dart';
import '../bloc/auth_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  late final TabController _tab;
  final _loginKey = GlobalKey<FormState>();
  final _signupKey = GlobalKey<FormState>();

  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _suEmailCtrl = TextEditingController();
  final _suPassCtrl = TextEditingController();
  final _suConfirmPassCtrl = TextEditingController();

  bool _loginPassVisible = false;
  bool _signupPassVisible = false;

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tab.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _suEmailCtrl.dispose();
    _suPassCtrl.dispose();
    _suConfirmPassCtrl.dispose();
    super.dispose();
  }

  void _login() {
    if (!_loginKey.currentState!.validate()) return;
    context.read<AuthBloc>().add(AuthEvent.login(email: _emailCtrl.text.trim(), password: _passCtrl.text));
  }

  void _signup() {
    if (!_signupKey.currentState!.validate()) return;
    context.read<AuthBloc>().add(AuthEvent.signUp(email: _suEmailCtrl.text.trim(), password: _suPassCtrl.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          Navigator.pushNamedAndRemoveUntil(context, AppRoutes.accounts, (route) => false);
        } else if (state.status == AuthStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Account created! Check your email to confirm.')));
          _tab.animateTo(0);
        } else if (state.status == AuthStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final loading = state.status == AuthStatus.loading;
          return Scaffold(
            backgroundColor: AppColors.background,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 48),
                    _buildHeader(),
                    const SizedBox(height: 36),
                    _buildTabBar(),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 520,
                      child: TabBarView(controller: _tab, children: [_buildLoginForm(loading), _buildSignupForm(loading)]),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(14)),
          child: const Icon(Icons.account_balance_wallet_rounded, color: AppColors.primary, size: 26),
        ),
        const SizedBox(height: 20),
        Text('Finance\nTracker', style: AppTextStyles.displayLarge),
        const SizedBox(height: 8),
        Text('Manage your accounts, income\nand expenses in one place.', style: AppTextStyles.bodyLarge),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 46,
      decoration: BoxDecoration(color: AppColors.ink100, borderRadius: BorderRadius.circular(12)),
      child: TabBar(
        controller: _tab,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: AppColors.ink900.withOpacity(0.06), blurRadius: 8, offset: const Offset(0, 2))],
        ),
        dividerColor: Colors.transparent,
        labelColor: AppColors.ink900,
        unselectedLabelColor: AppColors.ink500,
        labelStyle: AppTextStyles.labelLarge,
        unselectedLabelStyle: AppTextStyles.labelLarge,
        tabs: const [
          Tab(text: 'Login'),
          Tab(text: 'Sign Up'),
        ],
      ),
    );
  }

  Widget _buildLoginForm(bool loading) {
    return Form(
      key: _loginKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            label: 'Email Address',
            hint: 'you@example.com',
            controller: _emailCtrl,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Email required';
              if (!v.contains('@')) return 'Enter valid email';
              return null;
            },
          ),
          const SizedBox(height: 16),
          AppTextField(
            label: 'Password',
            hint: '••••••••',
            controller: _passCtrl,
            obscureText: !_loginPassVisible,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _login(),
            suffix: IconButton(
              icon: Icon(_loginPassVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: AppColors.ink500, size: 20),
              onPressed: () => setState(() => _loginPassVisible = !_loginPassVisible),
            ),
            validator: (v) {
              if (v == null || v.isEmpty) return 'Password required';
              return null;
            },
          ),
          const SizedBox(height: 28),
          AppButton(label: 'Login', loading: loading, onTap: _login),
          const SizedBox(height: 16),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text('Forgot password?', style: AppTextStyles.labelMedium.copyWith(color: AppColors.primary)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupForm(bool loading) {
    return Form(
      key: _signupKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            label: 'Email Address',
            hint: 'you@example.com',
            controller: _suEmailCtrl,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Email required';
              if (!v.contains('@')) return 'Enter valid email';
              return null;
            },
          ),
          const SizedBox(height: 16),
          AppTextField(
            label: 'Password',
            hint: '••••••••',
            controller: _suPassCtrl,
            obscureText: !_signupPassVisible,
            textInputAction: TextInputAction.next,
            suffix: IconButton(
              icon: Icon(_signupPassVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: AppColors.ink500, size: 20),
              onPressed: () => setState(() => _signupPassVisible = !_signupPassVisible),
            ),
            validator: (v) {
              if (v == null || v.length < 6) return 'Min 6 characters';
              return null;
            },
          ),
          const SizedBox(height: 16),
          AppTextField(
            label: 'Confirm Password',
            hint: '••••••••',
            controller: _suConfirmPassCtrl,
            obscureText: true,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _signup(),
            validator: (v) {
              if (v != _suPassCtrl.text) return 'Passwords do not match';
              return null;
            },
          ),
          const SizedBox(height: 28),
          AppButton(label: 'Create Account', loading: loading, onTap: _signup),
        ],
      ),
    );
  }
}
