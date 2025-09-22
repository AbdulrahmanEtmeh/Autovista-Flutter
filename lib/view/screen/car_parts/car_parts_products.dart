import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/cart/cart_controller.dart';

import '../../../controller/car_parts/car_parts_items_controller.dart';
import '../../../core/function/custom_app_bar.dart';
import '../../widget/car_parts/part_products_item.dart';

class CarPartsProducts extends StatelessWidget {
  const CarPartsProducts({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CarPartsItemsControllerImp());
    Get.put(CartController());
    return Scaffold(
      appBar: customAppBar(context, title: 'Car Parts'.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.025, horizontal: Get.width * 0.025),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<CarPartsItemsControllerImp>(
                builder: (controller) => SizedBox(
                  height: Get.height,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.carPartsItems.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: Get.height * 0.02),
                    itemBuilder: (context, index) {
                      return PartProductItem(
                        carPartsItemsModel: controller.carPartsItems[index],
                        cartIcon: Icons.add_shopping_cart_outlined,
                      );
                    },
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
