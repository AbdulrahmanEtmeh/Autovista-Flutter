import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/view/screen/car_parts/car_parts_brands.dart';
import 'package:graduation_project/view/screen/chat/chat_screen.dart';
import 'package:graduation_project/view/screen/home/home_page.dart';
import 'package:graduation_project/view/screen/search/search_screen.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
  moveToCart();
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentScreen = 0;

  List<Widget> pagesList = [
    const HomePage(),
    const CarPartsBrands(),
    const SearchScreen(),
    const ChatScreen(),
  ];

  List bottomBar = [
    {
      'title': 'Home'.tr,
      'icon': Icons.home,
    },
    {
      'title': 'Parts'.tr,
      'icon': Icons.construction_outlined,
    },
    {
      'title': 'Search'.tr,
      'icon': Icons.search_outlined,
    },
    {
      'title': 'Chat'.tr,
      'icon': Icons.sms_outlined,
    },
  ];

  @override
  changePage(int currentPage) {
    currentScreen = currentPage;
    update();
  }

  @override
  moveToCart() {
    Get.toNamed(AppRoutes.cart);
  }
}
