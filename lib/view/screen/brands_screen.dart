import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/class/handling_data_view.dart';
import 'package:graduation_project/core/function/custom_app_bar.dart';
import 'package:graduation_project/view/widget/categories_brands_favorite/brands/list_brands.dart';
import 'package:graduation_project/view/widget/categories_brands_favorite/brands/list_products_brands.dart';

import '../../controller/brands_screen_controller.dart';
import '../../controller/favorite/favorite_controller.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BrandsScreenControllerImp());
    if (!Get.isRegistered<FavoriteController>()) {
      Get.put(FavoriteController());
    }
    return Scaffold(
      appBar: customAppBar(context, title: 'Brands'.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.03, vertical: Get.height * 0.01),
        child: SingleChildScrollView(
          child: GetBuilder<BrandsScreenControllerImp>(
            builder: (controller) => Column(
              children: [
                ListBrands(),
                SizedBox(height: Get.height * 0.03),
                HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListProductsBrands(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
