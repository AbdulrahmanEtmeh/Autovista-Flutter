import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/services/my_services.dart';

class ThemeController extends GetxController {
  MyServices myServices = Get.find();
  late RxBool isDarkMode;

  @override
  void onInit() {
    super.onInit();
    // Get saved theme preference from SharedPreferences (default to dark mode)
    String? savedTheme = myServices.sharedPreferences.getString('theme');
    isDarkMode = RxBool(savedTheme != 'light'); // Default to dark mode
  }

  // Change theme and save preference
  void changeTheme(bool darkMode) {
    isDarkMode.value = darkMode;
    String themeValue = darkMode ? 'dark' : 'light';
    myServices.sharedPreferences.setString('theme', themeValue);

    // Update theme in GetX
    Get.changeThemeMode(darkMode ? ThemeMode.dark : ThemeMode.light);
  }

  // Get current theme name for display
  String get currentThemeName => isDarkMode.value ? 'Dark' : 'Light';
}
