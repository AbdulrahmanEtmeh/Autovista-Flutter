import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:get/get.dart';

import 'package:graduation_project/bindings/app_bindings.dart';
import 'package:graduation_project/core/localization/my_translation.dart';
import 'package:graduation_project/core/services/my_services.dart';
import 'package:graduation_project/core/constant/routes.dart';
import 'core/constant/app_strings.dart';
import 'core/function/show_local_notifications.dart';
import 'core/localization/locale_controller.dart';
import 'core/themes/app_dark_theme.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint("Message received: ${message.notification?.title}");
    debugPrint("Body: ${message.notification?.body}");

    if (message.notification != null) {
      showLocalNotification(message);
    }
  });
  // Local notification initialization
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher'); // your app icon
  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  // Ask for notification permission (needed on Android 13+ and iOS)
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission();
  debugPrint('User granted permission: ${settings.authorizationStatus}');
  // Device Orientations
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      translations: MyTranslation(),
      initialBinding: AppBindings(),
      locale: controller.initialLanguage,
      theme: AppDarkTheme.darkTheme,
      getPages: routes,
    );
  }
}
