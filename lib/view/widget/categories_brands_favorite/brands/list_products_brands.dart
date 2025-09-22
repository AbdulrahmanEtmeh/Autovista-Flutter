import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/data/model/car_model.dart';
import 'package:graduation_project/view/widget/categories_brands_favorite/brands/brand_product_interface.dart';

import '../../../../controller/brands_screen_controller.dart';
import '../../../../controller/favorite/favorite_controller.dart';

class ListProductsBrands extends GetView<BrandsScreenControllerImp> {
  const ListProductsBrands({
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
            controllerFav.isFavorite[controller.cars[index]['id']] =
                controller.cars[index]['is_favorite'];
            return BrandProductInterface(
              carModel: CarModel.fromJson(controller.cars[index]),
            );
          },
        ),
      ),
    );
  }
}
