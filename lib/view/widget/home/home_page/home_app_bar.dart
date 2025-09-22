import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/my_drawer_controller.dart';
import '../../../../controller/home/home_page_controller.dart';
import '../../../../core/constant/app_colors.dart';

class HomeAppBar extends GetView<HomePageControllerImp> {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyDrawerController drawerController = Get.put(MyDrawerController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.035),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              drawerController.drawerKey.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: AppColors.primaryWhite,
              size: Get.height * 0.035,
            ),
          ),
          SizedBox(width: Get.width * 0.025),
          Container(
            alignment: Alignment.centerLeft,
            width: Get.width * 0.6,
            height: Get.height * 0.04,
            child: Text(
              '${'Hello, '.tr} ${controller.userName}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.primaryWhite),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: AppColors.primaryWhite,
              size: Get.height * 0.035,
            ),
          ),
        ],
      ),
    );
  }
}
