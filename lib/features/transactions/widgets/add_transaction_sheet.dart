import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../models/models.dart';
import '../bloc/transactions_bloc.dart';

class AddTransactionSheet extends StatefulWidget {
  final String accountId;
  final TransactionType initialType;

  const AddTransactionSheet({super.key, required this.accountId, required this.initialType});
  @override
  State<AddTransactionSheet> createState() => _AddTransactionSheetState();
}

class _AddTransactionSheetState extends State<AddTransactionSheet> {
  final _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();
  final _noteCtrl = TextEditingController();
  late TransactionType _type;

  @override
  void initState() {
    super.initState();
    _type = widget.initialType;
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _amountCtrl.dispose();
    _noteCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<TransactionsBloc>().add(
      TransactionsEvent.transactionsAddRequested(
        accountId: widget.accountId,
        title: _titleCtrl.text.trim(),
        amount: double.parse(_amountCtrl.text),
        type: _type,
        note: _noteCtrl.text.trim().isEmpty ? null : _noteCtrl.text.trim(),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.of(context).viewInsets.bottom;
    final isIn = _type == TransactionType.checkIn;
    final typeColor = isIn ? AppColors.income : AppColors.expense;

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: EdgeInsets.fromLTRB(24, 16, 24, 24 + bottomPad),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(color: AppColors.ink300, borderRadius: BorderRadius.circular(2)),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(child: Text('Add Transaction', style: AppTextStyles.h2)),
                  _TypeToggle(
                    label: 'Check-In',
                    selected: _type == TransactionType.checkIn,
                    color: AppColors.income,
                    onTap: () => setState(() => _type = TransactionType.checkIn),
                  ),
                  const SizedBox(width: 8),
                  _TypeToggle(
                    label: 'Check-Out',
                    selected: _type == TransactionType.checkOut,
                    color: AppColors.expense,
                    onTap: () => setState(() => _type = TransactionType.checkOut),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Amount input
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: isIn ? AppColors.incomeLight : AppColors.expenseLight, borderRadius: BorderRadius.circular(14)),
                child: Row(
                  children: [
                    Text(isIn ? '+' : '-', style: AppTextStyles.amountHero.copyWith(color: typeColor, fontSize: 28)),
                    const SizedBox(width: 4),
                    Text('₹', style: AppTextStyles.amountHero.copyWith(color: typeColor.withOpacity(0.6), fontSize: 22)),
                    const SizedBox(width: 4),
                    Expanded(
                      child: TextFormField(
                        controller: _amountCtrl,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                        style: AppTextStyles.amountHero.copyWith(color: typeColor),
                        decoration: InputDecoration(
                          hintText: '0.00',
                          hintStyle: AppTextStyles.amountHero.copyWith(color: typeColor.withOpacity(0.3)),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          filled: false,
                          contentPadding: EdgeInsets.zero,
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Amount required';
                          final n = double.tryParse(v);
                          if (n == null || n <= 0) return 'Enter a valid amount';
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              AppTextField(
                label: 'Title',
                hint: 'e.g. Salary, Grocery, Rent…',
                controller: _titleCtrl,
                textInputAction: TextInputAction.next,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Title is required';
                  return null;
                },
              ),
              const SizedBox(height: 14),

              AppTextField(
                label: 'Note (optional)',
                hint: 'Any additional details…',
                controller: _noteCtrl,
                maxLines: 2,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => _submit(),
              ),
              const SizedBox(height: 24),

              AppButton(
                label: isIn ? 'Add Check-In' : 'Add Check-Out',
                onTap: _submit,
                variant: isIn ? AppButtonVariant.primary : AppButtonVariant.danger,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TypeToggle extends StatelessWidget {
  final String label;
  final bool selected;
  final Color color;
  final VoidCallback onTap;
  const _TypeToggle({required this.label, required this.selected, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? color.withOpacity(0.12) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: selected ? color : AppColors.ink300),
        ),
        child: Text(label, style: AppTextStyles.labelSmall.copyWith(color: selected ? color : AppColors.ink500)),
      ),
    );
  }
}
