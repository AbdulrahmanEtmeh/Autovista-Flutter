import 'package:flutter/material.dart';
import 'package:graduation_project/core/design/colors/app_colors_dark.dart';
import 'package:graduation_project/core/design/colors/app_colors_light.dart';

class AppGradients {
  static LinearGradient mainGradient({
    required bool isDarkMode,
    Alignment begin = Alignment.topLeft,
    Alignment end = Alignment.bottomRight,
  }) {
    final startColor = isDarkMode
        ? AppColorsDark.mainGradientStart
        : AppColorsLight.mainGradientStart;
    final endColor = isDarkMode
        ? AppColorsDark.mainGradientEnd
        : AppColorsLight.mainGradientEnd;
    return LinearGradient(
      begin: begin,
      end: end,
      colors: [startColor, endColor],
    );
  }

  static LinearGradient secondaryGradient({
    required bool isDarkMode,
    Alignment begin = Alignment.topLeft,
    Alignment end = Alignment.bottomRight,
  }) {
    final startColor = isDarkMode
        ? AppColorsDark.secondaryGradientStart
        : AppColorsLight.secondaryGradientStart;
    final endColor = isDarkMode
        ? AppColorsDark.secondaryGradientEnd
        : AppColorsLight.secondaryGradientEnd;
    return LinearGradient(
      begin: begin,
      end: end,
      colors: [startColor, endColor],
    );
  }

  static LinearGradient tertiaryGradient({
    required bool isDarkMode,
    Alignment begin = Alignment.topLeft,
    Alignment end = Alignment.bottomRight,
  }) {
    final startColor = isDarkMode
        ? AppColorsDark.tertiaryGradientStart
        : AppColorsLight.tertiaryGradientStart;
    final endColor = isDarkMode
        ? AppColorsDark.tertiaryGradientEnd
        : AppColorsLight.tertiaryGradientEnd;
    return LinearGradient(
      begin: begin,
      end: end,
      colors: [startColor, endColor],
    );
  }
}
