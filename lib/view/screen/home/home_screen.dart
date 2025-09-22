import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/my_drawer_controller.dart';
import 'package:graduation_project/controller/home/home_screen_controller.dart';

import '../../widget/shared/bottombar/custom_bottom_bar.dart';
import '../../widget/shared/bottombar/custom_floating_button.dart';
import '../../widget/shared/drawer/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    MyDrawerController drawerController = Get.put(MyDrawerController());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        key: drawerController.drawerKey,
        drawer: const MyDrawer(),
        floatingActionButton: CustomFloatingButton(
          onPressed: () {
            controller.moveToCart();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomBar(),
        body: controller.pagesList.elementAt(controller.currentScreen),
      ),
    );
  }
}
