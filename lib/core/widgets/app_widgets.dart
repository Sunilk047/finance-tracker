import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

// ─── AppButton ────────────────────────────────────────────────
enum AppButtonVariant { primary, secondary, danger, ghost }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final AppButtonVariant variant;
  final bool loading;
  final bool fullWidth;
  final Widget? icon;
  final double height;

  const AppButton({
    super.key,
    required this.label,
    this.onTap,
    this.variant = AppButtonVariant.primary,
    this.loading = false,
    this.fullWidth = true,
    this.icon,
    this.height = 52,
  });

  @override
  Widget build(BuildContext context) {
    final (bg, fg, border) = switch (variant) {
      AppButtonVariant.primary => (AppColors.primary, AppColors.white, Colors.transparent),
      AppButtonVariant.secondary => (AppColors.primaryLight, AppColors.primary, Colors.transparent),
      AppButtonVariant.danger => (AppColors.expenseLight, AppColors.expense, Colors.transparent),
      AppButtonVariant.ghost => (Colors.transparent, AppColors.ink700, AppColors.ink300),
    };
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: height,
      child: Material(
        color: bg,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: loading ? null : onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: border, width: 1.5),
            ),
            child: loading
                ? Center(
                    child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: fg)),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
                    children: [
                      if (icon != null) ...[
                        IconTheme(
                          data: IconThemeData(color: fg, size: 18),
                          child: icon!,
                        ),
                        const SizedBox(width: 8),
                      ],
                      Padding(
                        padding: fullWidth ? EdgeInsets.zero : const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(label, style: AppTextStyles.button.copyWith(color: fg)),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

// ─── AppTextField ─────────────────────────────────────────────
class AppTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffix;
  final Widget? prefix;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;

  const AppTextField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffix,
    this.prefix,
    this.maxLines = 1,
    this.inputFormatters,
    this.onChanged,
    this.autofocus = false,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.labelLarge),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: maxLines,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          autofocus: autofocus,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          style: AppTextStyles.bodyLarge.copyWith(color: AppColors.ink900),
          decoration: InputDecoration(hintText: hint, suffixIcon: suffix, prefixIcon: prefix),
        ),
      ],
    );
  }
}

// ─── AppCard ──────────────────────────────────────────────────
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? color;

  const AppCard({super.key, required this.child, this.padding, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? AppColors.surfaceCard,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: padding ?? const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.ink100),
          ),
          child: child,
        ),
      ),
    );
  }
}

// ─── AccountAvatar ────────────────────────────────────────────
class AccountAvatar extends StatelessWidget {
  final String name;
  final double size;
  final int colorIndex;

  const AccountAvatar({super.key, required this.name, this.size = 44, this.colorIndex = 0});

  @override
  Widget build(BuildContext context) {
    final bg = AppColors.accountChips[colorIndex % AppColors.accountChips.length];
    final initials = name.trim().split(' ').take(2).map((w) => w.isNotEmpty ? w[0].toUpperCase() : '').join();
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: bg.withOpacity(0.15), borderRadius: BorderRadius.circular(size * 0.3)),
      child: Center(
        child: Text(
          initials,
          style: TextStyle(fontSize: size * 0.36, fontWeight: FontWeight.w700, color: bg, letterSpacing: -0.5),
        ),
      ),
    );
  }
}

// ─── TransactionTypeBadge ─────────────────────────────────────
class TransactionTypeBadge extends StatelessWidget {
  final bool isIncome;
  const TransactionTypeBadge({super.key, required this.isIncome});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(color: isIncome ? AppColors.incomeLight : AppColors.expenseLight, borderRadius: BorderRadius.circular(6)),
      child: Text(
        isIncome ? 'IN' : 'OUT',
        style: AppTextStyles.labelSmall.copyWith(color: isIncome ? AppColors.income : AppColors.expense, letterSpacing: 0.5),
      ),
    );
  }
}

// ─── AmountText ───────────────────────────────────────────────
class AmountText extends StatelessWidget {
  final double amount;
  final bool isIncome;
  final TextStyle? style;

  const AmountText({super.key, required this.amount, required this.isIncome, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${isIncome ? '+' : '-'}₹${amount.toStringAsFixed(2)}',
      style: (style ?? AppTextStyles.amountMedium).copyWith(color: isIncome ? AppColors.income : AppColors.expense),
    );
  }
}

// ─── AppFilterChip ────────────────────────────────────────────
class AppFilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const AppFilterChip({super.key, required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: selected ? AppColors.primary : AppColors.ink300),
        ),
        child: Text(
          label,
          style: AppTextStyles.labelMedium.copyWith(
            color: selected ? AppColors.white : AppColors.ink500,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// ─── AppDividerWithLabel ──────────────────────────────────────
class AppDividerWithLabel extends StatelessWidget {
  final String label;
  const AppDividerWithLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          const Expanded(child: Divider()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(label, style: AppTextStyles.labelSmall),
          ),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }
}

// ─── EmptyState ───────────────────────────────────────────────
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? action;

  const EmptyState({super.key, required this.icon, required this.title, required this.subtitle, this.action});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(color: AppColors.ink100, shape: BoxShape.circle),
              child: Icon(icon, color: AppColors.ink300, size: 32),
            ),
            const SizedBox(height: 16),
            Text(title, style: AppTextStyles.h3, textAlign: TextAlign.center),
            const SizedBox(height: 6),
            Text(subtitle, style: AppTextStyles.bodySmall, textAlign: TextAlign.center),
            if (action != null) ...[const SizedBox(height: 20), action!],
          ],
        ),
      ),
    );
  }
}

// ─── ShimmerBox ───────────────────────────────────────────────
class ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const ShimmerBox({super.key, required this.width, required this.height, this.radius = 8});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: AppColors.ink100, borderRadius: BorderRadius.circular(radius)),
    );
  }
}
