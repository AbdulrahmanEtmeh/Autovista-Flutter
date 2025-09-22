import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/favorite/favorite_controller.dart';
import '../../../../controller/search/filter_result_controller.dart';
import 'filter_product_interface.dart';

class ListProductsFilter extends GetView<FilterResultController> {
  const ListProductsFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FavoriteController controllerFav = Get.find();
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: controller.cars.length,
          separatorBuilder: (context, index) =>
              SizedBox(height: Get.height * 0.025),
          itemBuilder: (context, index) {
            controllerFav.isFavorite[controller.cars[index].id] =
                controller.cars[index].isFavorite;
            return FilterProductInterface(
              carModel: controller.cars[index],
            );
          },
        ),
      ),
    );
  }
}
