import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/home/home_screen_controller.dart';

import '../../../../core/constant/app_colors.dart';
import 'bottom_bar_button.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
              color: AppColors.homeContainers,
              shape: const CircularNotchedRectangle(),
              notchMargin: 15,
              child: Row(
                children: [
                  ...List.generate(controller.pagesList.length + 1, (index) {
                    int i = index > 2 ? index - 1 : index;
                    return index == 2
                        ? const Spacer()
                        : BottomBarButton(
                            onPressed: () {
                              controller.changePage(i);
                            },
                            title: controller.bottomBar[i]['title'],
                            icon: controller.bottomBar[i]['icon'],
                            active:
                                controller.currentScreen == i ? true : false,
                          );
                  })
                ],
              ),
            ));
  }
}
