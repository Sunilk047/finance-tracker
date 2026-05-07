import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  static const displayLarge = TextStyle(fontSize: 32, fontWeight: FontWeight.w700, letterSpacing: -0.8, color: AppColors.ink900, height: 1.2);
  static const displayMedium = TextStyle(fontSize: 26, fontWeight: FontWeight.w700, letterSpacing: -0.5, color: AppColors.ink900, height: 1.25);

  static const h1 = TextStyle(fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: -0.3, color: AppColors.ink900, height: 1.3);
  static const h2 = TextStyle(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: -0.2, color: AppColors.ink900, height: 1.35);
  static const h3 = TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.ink900, height: 1.4);

  static const bodyLarge = TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.ink700, height: 1.5);
  static const bodyMedium = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.ink700, height: 1.5);
  static const bodySmall = TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.ink500, height: 1.5);

  static const labelLarge = TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.1, color: AppColors.ink700);
  static const labelMedium = TextStyle(fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 0.2, color: AppColors.ink500);
  static const labelSmall = TextStyle(fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.3, color: AppColors.ink500);

  static const amountHero = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    letterSpacing: -1.0,
    color: AppColors.ink900,
    fontFamily: 'monospace',
  );
  static const amountLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    color: AppColors.ink900,
    fontFamily: 'monospace',
  );
  static const amountMedium = TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.ink900, fontFamily: 'monospace');

  static const button = TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.1);
}
