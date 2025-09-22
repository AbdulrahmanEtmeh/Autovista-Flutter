import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/view/widget/settings/upper_profile_section.dart';

import '../../../controller/settings/settings_screen_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_routes.dart';
import '../../widget/settings/custom_list_tile.dart';
import '../../widget/shared/dialogs/delete_account_dialog.dart';
import '../../widget/shared/dialogs/rate_app_dialog.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsScreenControllerImp controller =
        Get.put(SettingsScreenControllerImp());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: Get.height * 0.13),
              child: const UpperProfileSection(),
            ),
            CustomListTile(
              title: 'Notifications',
              subtitle: 'Manage notifications',
              // TODO: Implement switch functionality
              trailing: const Switch(
                activeTrackColor: AppColors.primaryRed,
                inactiveThumbColor: AppColors.primaryWhite,
                value: true,
                onChanged: null,
                activeColor: AppColors.primaryRed,
              ),
              onTap: () {},
            ),
            CustomListTile(
              title: 'My Account',
              subtitle: 'Manage your account',
              onTap: () {
                controller.moveTo(AppRoutes.accountSettings);
              },
            ),
            CustomListTile(
              title: 'My Cars',
              subtitle: 'Show my cars',
              onTap: () {
                Get.toNamed(AppRoutes.myCars);
              },
            ),
            CustomListTile(
              title: 'Language',
              subtitle: 'Change app language',
              onTap: () {},
            ),
            CustomListTile(
              title: 'Terms & Conditions',
              subtitle: 'View terms & conditions',
              onTap: () {},
            ),
            CustomListTile(
              title: 'Privacy Policy',
              subtitle: 'View privacy policy',
              onTap: () {},
            ),
            CustomListTile(
              title: 'Rate Our App',
              subtitle: 'Rate our app on google play',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => const RateAppDialog(),
                );
              },
            ),
            CustomListTile(
              title: 'Contact Us',
              subtitle: 'Send us a message',
              onTap: () {},
            ),
            CustomListTile(
              title: 'Delete Account',
              subtitle: 'Delete profile and all orders and history',
              titleColor: AppColors.primaryRed,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.45),
                    child: const DeleteAccountDialog(),
                  ),
                );
              },
            ),
            CustomListTile(
              title: 'Logout',
              subtitle: '',
              titleColor: AppColors.primaryRed,
              trailing: Icon(
                Icons.logout,
                color: AppColors.primaryRed,
                size: Get.height * 0.03,
              ),
              onTap: () {
                controller.logoutFunction();
              },
            ),
          ],
        ),
      ),
    );
  }
}
