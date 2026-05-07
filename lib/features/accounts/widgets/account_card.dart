import 'package:flutter/material.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../models/models.dart';

class AccountCard extends StatelessWidget {
  final Account account;
  final AccountSummary? summary;

  const AccountCard({super.key, required this.account, this.summary});

  @override
  Widget build(BuildContext context) {
    final color = AppColors.accountChips[account.colorIndex % AppColors.accountChips.length];

    return AppCard(
      onTap: () => Navigator.pushNamed(context, AppRoutes.transactions, arguments: account),
      child: Row(children: [
        AccountAvatar(name: account.name, size: 52, colorIndex: account.colorIndex),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(account.name, style: AppTextStyles.h3),
          const SizedBox(height: 4),
          summary == null
              ? const ShimmerBox(width: 80, height: 13)
              : Text(
            'Balance: ${AppFormatters.currency(summary!.balance)}',
            style: AppTextStyles.bodySmall.copyWith(
              color: summary!.balance >= 0 ? AppColors.income : AppColors.expense,
              fontWeight: FontWeight.w600,
            ),
          ),
        ])),
        if (summary != null) ...[
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            _miniStat(Icons.arrow_downward_rounded, AppFormatters.currency(summary!.totalIn), AppColors.income),
            const SizedBox(height: 4),
            _miniStat(Icons.arrow_upward_rounded, AppFormatters.currency(summary!.totalOut), AppColors.expense),
          ]),
          const SizedBox(width: 10),
        ],
        const Icon(Icons.chevron_right_rounded, color: AppColors.ink300),
      ]),
    );
  }

  Widget _miniStat(IconData icon, String value, Color color) {
    return Row(children: [
      Icon(icon, color: color, size: 11),
      const SizedBox(width: 3),
      Text(value, style: AppTextStyles.labelSmall.copyWith(color: color)),
    ]);
  }
}