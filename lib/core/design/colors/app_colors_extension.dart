import 'package:flutter/material.dart';
import 'app_colors_light.dart';
import 'app_colors_dark.dart';
import 'app_gradients.dart';

@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color surfacePrimary;
  final Color contentPrimary;
  final Color contentSecondary;

  final bool isDarkMode;

  const AppColorsExtension({
    required this.surfacePrimary,
    required this.contentPrimary,
    required this.contentSecondary,
    required this.isDarkMode,
  });

  factory AppColorsExtension.light() {
    return const AppColorsExtension(
      surfacePrimary: AppColorsLight.surfacePrimary,
      contentPrimary: AppColorsLight.contentPrimary,
      contentSecondary: AppColorsLight.contentSecondary,
      isDarkMode: false,
    );
  }

  factory AppColorsExtension.dark() {
    return const AppColorsExtension(
      surfacePrimary: AppColorsDark.surfacePrimary,
      contentPrimary: AppColorsDark.contentPrimary,
      contentSecondary: AppColorsDark.contentSecondary,
      isDarkMode: true,
    );
  }

  LinearGradient get mainGradient =>
      AppGradients.mainGradient(isDarkMode: isDarkMode);
  LinearGradient get secondaryGradient =>
      AppGradients.secondaryGradient(isDarkMode: isDarkMode);
  LinearGradient get tertiaryGradient =>
      AppGradients.tertiaryGradient(isDarkMode: isDarkMode);

  @override
  AppColorsExtension copyWith({
    Color? surfacePrimary,
    Color? contentPrimary,
    Color? contentSecondary,
    bool? isDarkMode,
  }) {
    return AppColorsExtension(
      surfacePrimary: surfacePrimary ?? this.surfacePrimary,
      contentPrimary: contentPrimary ?? this.contentPrimary,
      contentSecondary: contentSecondary ?? this.contentSecondary,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }

  @override
  AppColorsExtension lerp(ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) {
      return this;
    }
    return AppColorsExtension(
      surfacePrimary: Color.lerp(surfacePrimary, other.surfacePrimary, t)!,
      contentPrimary: Color.lerp(contentPrimary, other.contentPrimary, t)!,
      contentSecondary:
          Color.lerp(contentSecondary, other.contentSecondary, t)!,
      isDarkMode: t < 0.5 ? isDarkMode : other.isDarkMode,
    );
  }
}
