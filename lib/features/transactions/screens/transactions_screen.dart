import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../models/models.dart';
import '../../../services/pdf_service.dart';
import '../bloc/transactions_bloc.dart';
import '../widgets/transaction_tile.dart';
import '../widgets/add_transaction_sheet.dart';

class TransactionsScreen extends StatefulWidget {
  final Account account;
  const TransactionsScreen({super.key, required this.account});
  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final _searchCtrl = TextEditingController();
  bool _searchOpen = false;

  @override
  void initState() {
    super.initState();
    context.read<TransactionsBloc>().add(TransactionsEvent.transactionsLoadRequested(accountId: widget.account.id));
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _TransactionsView(account: widget.account);
  }
}

class _TransactionsView extends StatefulWidget {
  final Account account;
  const _TransactionsView({required this.account});
  @override
  State<_TransactionsView> createState() => _TransactionsViewState();
}

class _TransactionsViewState extends State<_TransactionsView> {
  final _searchCtrl = TextEditingController();
  bool _searchOpen = false;

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionsBloc, TransactionsState>(
      listener: (context, state) {
        if (state.status == TransactionsStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: _buildAppBar(context),
        body: BlocBuilder<TransactionsBloc, TransactionsState>(
          builder: (context, state) {
            if (state.status == TransactionsStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.status == TransactionsStatus.success) {
              return RefreshIndicator(
                onRefresh: () async =>
                    context.read<TransactionsBloc>().add(TransactionsEvent.transactionsLoadRequested(accountId: widget.account.id)),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(padding: const EdgeInsets.fromLTRB(16, 16, 16, 0), child: _buildSummaryCard(state.summary!)),
                    ),
                    SliverToBoxAdapter(child: _buildFilterRow(context, state.activeFilter)),
                    _buildTransactionList(context, state),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
        floatingActionButton: _buildFabs(context),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: _searchOpen
          ? TextField(
              controller: _searchCtrl,
              autofocus: true,
              style: AppTextStyles.bodyLarge.copyWith(color: AppColors.ink900),
              decoration: InputDecoration(
                hintText: 'Search title, amount, note…',
                border: InputBorder.none,
                hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.ink300),
              ),
              onChanged: (v) => context.read<TransactionsBloc>().add(TransactionsEvent.transactionsSearchChanged(query: v)),
            )
          : Text(widget.account.name, style: AppTextStyles.h2),
      leading: BackButton(color: AppColors.ink900),
      actions: [
        IconButton(
          icon: Icon(_searchOpen ? Icons.close_rounded : Icons.search_rounded, color: AppColors.ink700),
          onPressed: () {
            setState(() => _searchOpen = !_searchOpen);
            if (!_searchOpen) {
              _searchCtrl.clear();
              context.read<TransactionsBloc>().add(const TransactionsEvent.transactionsSearchChanged(query: ''));
            }
          },
        ),
        BlocBuilder<TransactionsBloc, TransactionsState>(
          builder: (context, state) {
            if (state.status != TransactionsStatus.success) return const SizedBox.shrink();
            return IconButton(
              icon: const Icon(Icons.picture_as_pdf_outlined, color: AppColors.ink700),
              tooltip: 'Export PDF',
              onPressed: () => _exportPdf(context, state),
            );
          },
        ),
        const SizedBox(width: 4),
      ],
    );
  }

  Widget _buildSummaryCard(AccountSummary summary) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF1A56DB), Color(0xFF0E3FAB)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.25), blurRadius: 20, offset: const Offset(0, 6))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AccountAvatar(name: widget.account.name, size: 36, colorIndex: widget.account.colorIndex),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.account.name, style: AppTextStyles.labelLarge.copyWith(color: AppColors.white)),
                  Text('Available Balance', style: AppTextStyles.labelSmall.copyWith(color: AppColors.white.withOpacity(0.7))),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(AppFormatters.currency(summary.balance), style: AppTextStyles.amountHero.copyWith(color: AppColors.white)),
          const SizedBox(height: 16),
          Row(
            children: [
              _balanceStat('Check-In', summary.totalIn, true),
              Container(width: 1, height: 36, color: AppColors.white.withOpacity(0.2), margin: const EdgeInsets.symmetric(horizontal: 16)),
              _balanceStat('Check-Out', summary.totalOut, false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _balanceStat(String label, double amount, bool isIn) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(color: AppColors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(8)),
            child: Icon(isIn ? Icons.south_west_rounded : Icons.north_east_rounded, color: AppColors.white, size: 14),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.labelSmall.copyWith(color: AppColors.white.withOpacity(0.7))),
              Text(AppFormatters.currency(amount), style: AppTextStyles.amountMedium.copyWith(color: AppColors.white, fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterRow(BuildContext context, TransactionFilter active) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 0, 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: TransactionFilter.values
              .map(
                (f) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: AppFilterChip(
                    label: f.label,
                    selected: active == f,
                    onTap: () => context.read<TransactionsBloc>().add(TransactionsEvent.transactionsFilterChanged(filter: f)),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildTransactionList(BuildContext context, state) {
    final txList = state.filtered;
    if (txList.isEmpty) {
      return const SliverFillRemaining(
        child: EmptyState(icon: Icons.receipt_long_outlined, title: 'No Transactions', subtitle: 'Tap + to add your first\ncheck-in or check-out.'),
      );
    }
    final groups = _groupByDate(txList);
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, i) {
          final entry = groups[i];
          if (entry is String) return AppDividerWithLabel(label: entry);
          final tx = entry as Transaction;
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TransactionTile(
              transaction: tx,
              onDeleted: () => context.read<TransactionsBloc>().add(TransactionsEvent.transactionsDeleteRequested(transactionId: tx.id)),
            ),
          );
        }, childCount: groups.length),
      ),
    );
  }

  List<dynamic> _groupByDate(List<Transaction> txList) {
    final result = <dynamic>[];
    String? last;
    for (final tx in txList) {
      final label = AppFormatters.relativeDate(tx.createdAt);
      if (label != last) {
        result.add(label);
        last = label;
      }
      result.add(tx);
    }
    return result;
  }

  Widget _buildFabs(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _FabAction(label: 'Check-In', icon: Icons.add_rounded, color: AppColors.income, onTap: () => _showSheet(context, TransactionType.checkIn)),
        const SizedBox(height: 10),
        _FabAction(
          label: 'Check-Out',
          icon: Icons.remove_rounded,
          color: AppColors.expense,
          onTap: () => _showSheet(context, TransactionType.checkOut),
        ),
      ],
    );
  }

  void _showSheet(BuildContext context, TransactionType type) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AddTransactionSheet(accountId: widget.account.id, initialType: type),
    );
  }

  Future<void> _exportPdf(BuildContext context, state) async {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Generating PDF…')));
    await PdfExportService.exportTransactions(
      account: widget.account,
      transactions: state.filtered,
      totalIn: state.summary.totalIn,
      totalOut: state.summary.totalOut,
    );
  }
}

class _FabAction extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  const _FabAction({required this.label, required this.icon, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [BoxShadow(color: color.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 4))],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.white, size: 18),
            const SizedBox(width: 6),
            Text(label, style: AppTextStyles.button.copyWith(color: AppColors.white)),
          ],
        ),
      ),
    );
  }
}
