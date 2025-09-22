import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/favorite/favorite_controller.dart';
import 'package:graduation_project/controller/home/home_page_controller.dart';
import 'package:graduation_project/data/model/car_model.dart';

import '../../shared/product_card/product_card.dart';

class TodayList extends GetView<HomePageControllerImp> {
  const TodayList({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController controllerFav = Get.find();
    return SizedBox(
      height: Get.height * 0.25,
      width: Get.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.cars.length,
          separatorBuilder: (context, index) =>
              SizedBox(width: Get.width * 0.05),
          itemBuilder: (context, index) {
            controllerFav.isFavorite[controller.cars[index]['id']] =
                controller.cars[index]['is_favorite'];
            return ProductCard(
              carModel: CarModel.fromJson(controller.cars[index]),
            );
          },
        ),
      ),
    );
  }
}
