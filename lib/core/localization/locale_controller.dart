import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/services/my_services.dart';

class LocaleController extends GetxController {
  Locale? initialLanguage;
  MyServices myServices = Get.find();

  changeLanguage(String languageCode) {
    Locale locale = Locale(languageCode);
    myServices.sharedPreferences.setString('language', languageCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString('language');
    if (sharedPrefLang == 'ar') {
      initialLanguage = const Locale('ar');
    } else if (sharedPrefLang == 'en') {
      initialLanguage = const Locale('en');
    } else {
      initialLanguage = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
