import 'package:flutter/material.dart';
import 'package:graduation_project/core/design/typography/app_text_styles_ar.dart';
import 'package:graduation_project/core/design/typography/app_text_styles_en.dart';
import '../colors/app_colors_extension.dart';
import '../spacing/app_spacing.dart';

extension ThemeX on BuildContext {
  AppColorsExtension get colors =>
      Theme.of(this).extension<AppColorsExtension>() ??
      AppColorsExtension.light();

  dynamic get textStyles => isArabic ? AppTextStylesAr : AppTextStylesEn;

  bool get isArabic => Localizations.localeOf(this).languageCode == 'ar';

  String get primaryFontFamily => isArabic ? 'Cairo' : 'Poppins';
  String get secondaryFontFamily => 'Vollkorn_SC';

  // AppSpacing get spacing => AppSpacing;
}
