import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/my_drawer_controller.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/view/widget/shared/drawer/components/personal_info.dart';

import '../../../../core/constant/app_colors.dart';
import 'components/header_background.dart';
import 'components/drawer_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyDrawerController drawerController = Get.put(MyDrawerController());
    return Drawer(
      shadowColor: AppColors.pureBlack,
      elevation: 0.3,
      width: Get.width * 0.75,
      backgroundColor: AppColors.drawerBackGround,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.210,
              child: const Stack(
                children: [
                  HeaderBackground(),
                  PersonalInfo(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Get.height * 0.03, horizontal: Get.width * 0.04),
              child: Column(
                children: [
                  DrawerListTile(
                    onTap: () {
                      drawerController.drawerNavigation(AppRoutes.home);
                    },
                    icon: Icons.home,
                    title: 'Home'.tr,
                  ),
                  DrawerListTile(
                    onTap: () {
                      drawerController.drawerNavigation(AppRoutes.favorite);
                    },
                    icon: Icons.favorite,
                    title: "Favorite".tr,
                  ),
                  DrawerListTile(
                    onTap: () {},
                    icon: Icons.notifications,
                    title: "Notifications".tr,
                  ),
                  DrawerListTile(
                    onTap: () {
                      drawerController.drawerNavigation(AppRoutes.settings);
                    },
                    icon: Icons.settings,
                    title: "Settings".tr,
                  ),
                  DrawerListTile(
                    onTap: () {},
                    icon: Icons.person_add,
                    title: "Invite Friends".tr,
                  ),
                  SizedBox(height: Get.height * 0.2),
                  const Divider(
                    color: AppColors.carDetailsGrey,
                    thickness: 0.3,
                  ),
                  SizedBox(height: Get.height * 0.02),
                  DrawerListTile(
                    onTap: () {
                      drawerController.logOut();
                    },
                    icon: Icons.logout,
                    title: 'Logout'.tr,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
