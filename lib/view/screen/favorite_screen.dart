import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/favorite/my_favorite_controller.dart';
import 'package:graduation_project/core/class/handling_data_view.dart';
import 'package:graduation_project/core/function/custom_app_bar.dart';
import 'package:graduation_project/view/widget/categories_brands_favorite/favorite_product_interface.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      appBar: customAppBar(context, title: 'Favorite'.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.03, vertical: Get.height * 0.01),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GetBuilder<MyFavoriteController>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: controller.data.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: Get.height * 0.025),
                        itemBuilder: (context, index) {
                          return FavoriteProductInterface(
                            carModel: controller.data[index],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
