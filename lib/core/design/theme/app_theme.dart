import 'package:flutter/material.dart';
import '../colors/app_colors_common.dart';
import '../colors/app_colors_light.dart';
import '../colors/app_colors_dark.dart';
import '../colors/app_colors_extension.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: AppColorsLight.surfacePrimary,
          colorScheme: const ColorScheme.light(
            primary: AppColorsLight.contentPrimary,
            secondary: AppColorsLight.contentSecondary,
          ),
          extensions: <ThemeExtension<dynamic>>[
            AppColorsExtension.light(),
          ]);

  static ThemeData get darkTheme => ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColorsDark.surfacePrimary,
          colorScheme: const ColorScheme.dark(
            primary: AppColorsDark.contentPrimary,
            secondary: AppColorsDark.contentSecondary,
          ),
          extensions: <ThemeExtension<dynamic>>[
            AppColorsExtension.dark(),
          ]);
}
