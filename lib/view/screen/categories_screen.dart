import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/categories_screen_controller.dart';
import 'package:graduation_project/core/class/handling_data_view.dart';
import 'package:graduation_project/core/function/custom_app_bar.dart';
import 'package:graduation_project/view/widget/categories_brands_favorite/categories/list_products_categories.dart';
import 'package:graduation_project/view/widget/categories_brands_favorite/categories/list_categories.dart';

import '../../controller/favorite/favorite_controller.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesScreenControllerImp());
    Get.put(FavoriteController());
    return Scaffold(
      appBar: customAppBar(context, title: 'Categories'.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.03, vertical: Get.height * 0.01),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ListCategories(),
              SizedBox(height: Get.height * 0.03),
              GetBuilder<CategoriesScreenControllerImp>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: const ListProductsCategories(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
