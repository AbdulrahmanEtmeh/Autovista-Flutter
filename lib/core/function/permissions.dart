import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestNotificationPermission() async {
  if (Platform.isAndroid) {
    // Only Android 13+ has runtime notification permission
    var status = await Permission.notification.status;
    if (!status.isGranted) {
      var result = await Permission.notification.request();
      if (result.isGranted) {
        debugPrint("Notification permission granted");
      } else {
        debugPrint("Notification permission denied");
      }
    }
  }
}
