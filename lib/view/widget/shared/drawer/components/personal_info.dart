import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/my_drawer_controller.dart';
import '../../../../../core/constant/app_colors.dart';
import 'drawer_avatar.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    MyDrawerController drawerController = Get.find<MyDrawerController>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: Get.width * 0.4,
                child: Text(
                  drawerController.userName!,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.primaryWhite,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              SizedBox(
                width: Get.width * 0.4,
                child: FittedBox(
                  child: Text(
                    drawerController.email!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.primaryWhite,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
              ),
            ],
          ),
          const DrawerAvatar(),
        ],
      ),
    );
  }
}
