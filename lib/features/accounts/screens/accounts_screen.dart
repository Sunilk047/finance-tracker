import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../auth/bloc/auth_bloc.dart';
import '../bloc/accounts_bloc.dart';
import '../widgets/account_card.dart';
import '../widgets/add_account_sheet.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});
  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AccountsBloc>().add(const AccountsEvent.accountsLoadRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountsBloc, AccountsState>(
      listener: (context, state) {
        if (state.status == AccountsStatus.error && state.error.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        final authState = context.read<AuthBloc>().state;
        final email = authState.status == AuthStatus.authenticated ? authState.email : '';
        final greeting = _greeting();
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () => Navigator.pushNamed(context, AppRoutes.profile),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [AppColors.primary, AppColors.primaryDark]),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(email.isNotEmpty ? email[0].toUpperCase() : 'U', style: AppTextStyles.h3.copyWith(color: AppColors.white)),
                  ),
                ),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(greeting, style: AppTextStyles.bodySmall),
                const SizedBox(height: 2),
                Text(email.split('@').first, style: AppTextStyles.h1, maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          body: BlocBuilder<AccountsBloc, AccountsState>(
            builder: (context, state) {
              return RefreshIndicator(
                onRefresh: () async => context.read<AccountsBloc>().add(const AccountsEvent.accountsLoadRequested()),
                child: CustomScrollView(
                  slivers: [
                    // _buildSliverHeader(context),
                    _buildTotalBalanceBanner(state),
                    _buildSectionTitle('My Accounts'),
                    _buildAccountList(context, state),
                  ],
                ),
              );
            },
          ),
          floatingActionButton: _buildFab(context),
        );
      },
    );
  }

  // ── Total Balance Banner ──────────────────────────────────────
  SliverToBoxAdapter _buildTotalBalanceBanner(AccountsState state) {
    double totalBalance = 0, totalIn = 0, totalOut = 0;
    int accountCount = 0;

    if (state.status == AccountsStatus.success) {
      accountCount = state.accounts.length;
      for (final summary in state.summaries.values) {
        totalBalance += summary.balance;
        totalIn += summary.totalIn;
        totalOut += summary.totalOut;
      }
    }

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
        child: Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFF1A56DB), Color(0xFF0E3FAB)], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 24, offset: const Offset(0, 8))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Total Balance', style: AppTextStyles.labelMedium.copyWith(color: AppColors.white.withOpacity(0.7))),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: AppColors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
                    child: Text('$accountCount Accounts', style: AppTextStyles.labelSmall.copyWith(color: AppColors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              state.status == AccountsStatus.loading
                  ? const ShimmerBox(width: 180, height: 40, radius: 8)
                  : Text(AppFormatters.currency(totalBalance), style: AppTextStyles.amountHero.copyWith(color: AppColors.white, fontSize: 34)),
              const SizedBox(height: 20),
              // In/Out row
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(child: _statChip('Total In', totalIn, true)),
                    Container(width: 1, color: AppColors.white.withOpacity(0.2), margin: const EdgeInsets.symmetric(horizontal: 12)),
                    Expanded(child: _statChip('Total Out', totalOut, false)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statChip(String label, double amount, bool isIn) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(color: AppColors.white.withOpacity(0.15), shape: BoxShape.circle),
              child: Icon(isIn ? Icons.south_rounded : Icons.north_rounded, color: AppColors.white, size: 12),
            ),
            const SizedBox(width: 6),
            Text(label, style: AppTextStyles.labelSmall.copyWith(color: AppColors.white.withOpacity(0.7))),
          ],
        ),
        const SizedBox(height: 4),
        Text(AppFormatters.currency(amount), style: AppTextStyles.amountMedium.copyWith(color: AppColors.white, fontSize: 14)),
      ],
    );
  }

  // ── Section title ─────────────────────────────────────────────
  SliverToBoxAdapter _buildSectionTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Text(title, style: AppTextStyles.h3),
      ),
    );
  }

  // ── Account list ──────────────────────────────────────────────
  Widget _buildAccountList(BuildContext context, AccountsState state) {
    if (state.status == AccountsStatus.loading) {
      return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, __) => const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: ShimmerBox(width: double.infinity, height: 90, radius: 16),
            ),
            childCount: 3,
          ),
        ),
      );
    }

    // if (state is AccountsLoaded || state is AccountsOperationLoading) {
    //   final accounts = state is AccountsLoaded
    //       ? (state as AccountsLoaded).accounts
    //       : (state as AccountsOperationLoading).current.accounts;
    //   final summaries = state is AccountsLoaded
    //       ? (state as AccountsLoaded).summaries
    //       : (state as AccountsOperationLoading).current.summaries;

    // if (state.accounts.isEmpty) {
    //   return SliverFillRemaining(
    //     child: EmptyState(
    //       icon: Icons.account_balance_outlined,
    //       title: 'No Accounts Yet',
    //       subtitle: 'Create your first account to start\ntracking income and expenses.',
    //       action: AppButton(
    //         label: 'Create Account',
    //         fullWidth: false,
    //         icon: const Icon(Icons.add),
    //         onTap: () => _showAddSheet(context),
    //       ),
    //     ),
    //   );
    // }
    if (state.status == AccountsStatus.success && state.accounts.isEmpty) {
      return SliverFillRemaining(
        child: EmptyState(
          icon: Icons.account_balance_outlined,
          title: 'No Accounts Yet',
          subtitle: 'Create your first account to start\ntracking income and expenses.',
          action: AppButton(label: 'Create Account', fullWidth: false, icon: const Icon(Icons.add), onTap: () => _showAddSheet(context)),
        ),
      );
    }
    if (state.status == AccountsStatus.success && state.accounts.isNotEmpty) {
      return SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, i) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AccountCard(account: state.accounts[i], summary: state.summaries[state.accounts[i].id]),
            ),
            childCount: state.accounts.length,
          ),
        ),
      );
    }

    return const SliverToBoxAdapter(child: SizedBox.shrink());
  }

  Widget _buildFab(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => _showAddSheet(context),
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      icon: const Icon(Icons.add_rounded),
      label: Text('New Account', style: AppTextStyles.button),
      elevation: 2,
    );
  }

  void _showAddSheet(BuildContext context) {
    showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: Colors.transparent, builder: (_) => const AddAccountSheet());
  }

  String _greeting() {
    final h = DateTime.now().hour;
    if (h < 12) return 'Good morning 👋';
    if (h < 17) return 'Good afternoon 👋';
    return 'Good evening 👋';
  }
}
