import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../core/router/app_router.dart';
import '../accounts/bloc/accounts_bloc.dart';
import '../auth/bloc/auth_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    final accountsState = context.watch<AccountsBloc>().state;

    final email = /*authState is AuthAuthenticated*/ authState.status == AuthStatus.authenticated ? authState.email : '';
    final initial = email.isNotEmpty ? email[0].toUpperCase() : 'U';

    int accountCount = 0;
    double totalBalance = 0, totalIn = 0, totalOut = 0;

    if (accountsState.status == AccountsStatus.success) {
      accountCount = accountsState.accounts.length;
      for (final s in accountsState.summaries.values) {
        totalBalance += s.balance;
        totalIn += s.totalIn;
        totalOut += s.totalOut;
      }
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Profile', style: AppTextStyles.h2),
        leading: BackButton(color: AppColors.ink900),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Avatar + email ────────────────────────────────────
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [AppColors.primary, AppColors.primaryDark]),
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 6))],
                      ),
                      child: Center(
                        child: Text(initial, style: AppTextStyles.displayMedium.copyWith(color: AppColors.white)),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(email, style: AppTextStyles.h3),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(color: AppColors.incomeLight, borderRadius: BorderRadius.circular(20)),
                      child: Text('Active Account', style: AppTextStyles.labelSmall.copyWith(color: AppColors.income)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // ── Stats grid ────────────────────────────────────────
              Text('Overview', style: AppTextStyles.h3),
              const SizedBox(height: 12),
              Row(
                children: [
                  _StatCard(label: 'Accounts', value: '$accountCount', icon: Icons.account_balance_outlined, color: AppColors.primary),
                  const SizedBox(width: 12),
                  _StatCard(
                    label: 'Net Balance',
                    value: AppFormatters.currency(totalBalance),
                    icon: Icons.account_balance_wallet_outlined,
                    color: totalBalance >= 0 ? AppColors.income : AppColors.expense,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _StatCard(label: 'Total In', value: AppFormatters.currency(totalIn), icon: Icons.south_west_rounded, color: AppColors.income),
                  const SizedBox(width: 12),
                  _StatCard(label: 'Total Out', value: AppFormatters.currency(totalOut), icon: Icons.north_east_rounded, color: AppColors.expense),
                ],
              ),
              const SizedBox(height: 28),

              // ── Settings / actions ────────────────────────────────
              Text('Settings', style: AppTextStyles.h3),
              const SizedBox(height: 12),
              AppCard(
                child: Column(
                  children: [
                    _SettingsRow(
                      icon: Icons.notifications_outlined,
                      label: 'Notifications',
                      trailing: Switch(value: false, onChanged: (_) {}, activeColor: AppColors.primary),
                    ),
                    const Divider(height: 1),
                    _SettingsRow(icon: Icons.lock_outline_rounded, label: 'Change Password', onTap: () {}),
                    const Divider(height: 1),
                    _SettingsRow(icon: Icons.info_outline_rounded, label: 'About App', onTap: () => _showAbout(context)),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // ── Sign out ──────────────────────────────────────────
              AppButton(label: 'Sign Out', variant: AppButtonVariant.danger, icon: const Icon(Icons.logout_rounded), onTap: () => _signOut(context)),
              const SizedBox(height: 12),
              Center(child: Text('Finance Tracker v1.0.0', style: AppTextStyles.labelSmall)),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void _signOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Sign Out', style: AppTextStyles.h3),
        content: Text('Are you sure you want to sign out?', style: AppTextStyles.bodyMedium),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<AuthBloc>().add(const AuthEvent.logout());
              Navigator.pushNamedAndRemoveUntil(context, AppRoutes.auth, (_) => false);
            },
            child: Text('Sign Out', style: AppTextStyles.labelLarge.copyWith(color: AppColors.expense)),
          ),
        ],
      ),
    );
  }

  void _showAbout(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Finance Tracker', style: AppTextStyles.h3),
        content: Text(
          'Version 1.0.0\nBuilt with Flutter + Supabase\n\nTrack income and expenses across multiple accounts.',
          style: AppTextStyles.bodyMedium,
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Close'))],
      ),
    );
  }
}

// ─── _StatCard ────────────────────────────────────────────────
class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({required this.label, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.ink100),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, color: color, size: 18),
            ),
            const SizedBox(height: 12),
            Text(label, style: AppTextStyles.labelSmall),
            const SizedBox(height: 2),
            Text(
              value,
              style: AppTextStyles.amountMedium.copyWith(fontSize: 14, color: AppColors.ink900),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// ─── _SettingsRow ─────────────────────────────────────────────
class _SettingsRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Widget? trailing;

  const _SettingsRow({required this.icon, required this.label, this.onTap, this.trailing});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(color: AppColors.ink100, borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, color: AppColors.ink700, size: 18),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(label, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.ink900)),
            ),
            trailing ?? (onTap != null ? const Icon(Icons.chevron_right_rounded, color: AppColors.ink300, size: 20) : const SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
