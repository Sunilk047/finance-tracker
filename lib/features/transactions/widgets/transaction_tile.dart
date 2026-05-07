import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../models/models.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback onDeleted;

  const TransactionTile({super.key, required this.transaction, required this.onDeleted});

  @override
  Widget build(BuildContext context) {
    final tx = transaction;
    return AppCard(
      child: Row(children: [
        Container(
          width: 44, height: 44,
          decoration: BoxDecoration(
            color: tx.isIncome ? AppColors.incomeLight : AppColors.expenseLight,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(tx.isIncome ? Icons.south_west_rounded : Icons.north_east_rounded, color: tx.isIncome ? AppColors.income : AppColors.expense, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(tx.title, style: AppTextStyles.h3, maxLines: 1, overflow: TextOverflow.ellipsis),
          if (tx.note != null && tx.note!.isNotEmpty) ...[
            const SizedBox(height: 2),
            Text(tx.note!, style: AppTextStyles.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
          const SizedBox(height: 3),
          Text(AppFormatters.time(tx.createdAt), style: AppTextStyles.labelSmall),
        ])),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          AmountText(amount: tx.amount, isIncome: tx.isIncome, style: AppTextStyles.amountMedium),
          const SizedBox(height: 4),
          TransactionTypeBadge(isIncome: tx.isIncome),
        ]),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () => _confirmDelete(context),
          child: Padding(padding: const EdgeInsets.all(4), child: Icon(Icons.delete_outline_rounded, color: AppColors.ink300, size: 18)),
        ),
      ]),
    );
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Delete Transaction', style: AppTextStyles.h3),
        content: Text('Delete "${transaction.title}"?', style: AppTextStyles.bodyMedium),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text('Delete', style: AppTextStyles.labelLarge.copyWith(color: AppColors.expense)),
          ),
        ],
      ),
    );
    if (ok == true) onDeleted();
  }
}