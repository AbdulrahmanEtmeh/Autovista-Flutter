import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/settings/settings_screen_controller.dart';

void showThemeDialog(
  BuildContext context,
  SettingsScreenControllerImp controller,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Choose Theme'),
      content: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Light Mode'),
              leading: Radio<bool>(
                value: false,
                groupValue: controller.themeController.isDarkMode.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.changeTheme(value);
                    Get.back();
                  }
                },
              ),
              onTap: () {
                controller.changeTheme(false);
                Get.back();
              },
            ),
            ListTile(
              title: const Text('Dark Mode'),
              leading: Radio<bool>(
                value: true,
                groupValue: controller.themeController.isDarkMode.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.changeTheme(value);
                    Get.back();
                  }
                },
              ),
              onTap: () {
                controller.changeTheme(true);
                Get.back();
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
      ],
    ),
  );
}
