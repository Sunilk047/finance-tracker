import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_widgets.dart';
import '../bloc/account_bloc.dart';

class AddAccountSheet extends StatefulWidget {
  const AddAccountSheet({super.key});
  @override State<AddAccountSheet> createState() => _AddAccountSheetState();
}

class _AddAccountSheetState extends State<AddAccountSheet> {
  final _nameCtrl = TextEditingController();
  final _formKey  = GlobalKey<FormState>();
  int  _color     = 0;

  static const _presets = ['Home', 'Shop', 'Personal', 'Business', 'Savings', 'Travel'];

  @override
  void dispose() { _nameCtrl.dispose(); super.dispose(); }

  void _create() {
    if (!_formKey.currentState!.validate()) return;
    context.read<AccountsBloc>().add(AccountsCreateRequested(name: _nameCtrl.text.trim(), colorIndex: _color));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.of(context).viewInsets.bottom;
    return BlocListener<AccountsBloc, AccountsState>(
      listener: (context, state) {
        if (state is AccountsFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Container(
        decoration: const BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        padding: EdgeInsets.fromLTRB(24, 16, 24, 24 + bottomPad),
        child: Form(key: _formKey, child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: AppColors.ink300, borderRadius: BorderRadius.circular(2)))),
          const SizedBox(height: 20),
          Text('New Account', style: AppTextStyles.h2),
          const SizedBox(height: 20),

          Text('Quick Pick', style: AppTextStyles.labelMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8, runSpacing: 8,
            children: _presets.map((name) => GestureDetector(
              onTap: () => setState(() => _nameCtrl.text = name),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(border: Border.all(color: AppColors.ink300), borderRadius: BorderRadius.circular(8)),
                child: Text(name, style: AppTextStyles.labelMedium),
              ),
            )).toList(),
          ),
          const SizedBox(height: 20),

          AppTextField(
            label: 'Account Name', hint: 'e.g. Home, Shop, Personal…',
            controller: _nameCtrl, autofocus: true,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _create(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'Name is required';
              if (v.trim().length > 30) return 'Max 30 characters';
              return null;
            },
          ),
          const SizedBox(height: 20),

          Text('Color', style: AppTextStyles.labelMedium),
          const SizedBox(height: 10),
          Row(children: List.generate(AppColors.accountChips.length, (i) {
            final sel = i == _color;
            return GestureDetector(
              onTap: () => setState(() => _color = i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                margin: const EdgeInsets.only(right: 10),
                width: 32, height: 32,
                decoration: BoxDecoration(
                  color: AppColors.accountChips[i], shape: BoxShape.circle,
                  border: sel ? Border.all(color: AppColors.ink900, width: 2.5) : null,
                ),
                child: sel ? const Icon(Icons.check_rounded, color: AppColors.white, size: 16) : null,
              ),
            );
          })),
          const SizedBox(height: 28),

          AppButton(label: 'Create Account', icon: const Icon(Icons.add_rounded), onTap: _create),
        ])),
      ),
    );
  }
}