import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/search/search_screen_controller.dart';
import 'package:graduation_project/core/constant/app_colors.dart';

import '../../../controller/favorite/favorite_controller.dart';
import '../../../data/model/car_model.dart';
import 'search_product_interface.dart';

class ListProductsSearch extends GetView<SearchScreenControllerImp> {
  final List<CarModel> listCars;
  const ListProductsSearch({super.key, required this.listCars});

  @override
  Widget build(BuildContext context) {
    FavoriteController controllerFav = Get.find();
    if (listCars.isEmpty) {
      return Center(
        child: Text(
          'No results found'.tr,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.primaryWhite),
        ),
      );
    }
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: controller.listCars.length,
          separatorBuilder: (context, index) =>
              SizedBox(height: Get.height * 0.025),
          itemBuilder: (context, index) {
            controllerFav.isFavorite[controller.listCars[index].id] =
                controller.listCars[index].isFavorite;
            return SearchProductInterface(
              carModel: controller.listCars[index],
            );
          },
        ),
      ),
    );
  }
}
