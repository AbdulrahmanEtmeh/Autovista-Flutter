import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/categories_screen_controller.dart';
import 'package:graduation_project/data/model/car_categories_model.dart';

import 'categories.dart';

class ListCategories extends GetView<CategoriesScreenControllerImp> {
  const ListCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.05,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.carCategories.length,
        separatorBuilder: (context, index) =>
            SizedBox(width: Get.width * 0.025),
        itemBuilder: (context, index) => Categories(
          selectedCategory: index,
          carCategoriesModel:
              CarCategoriesModel.fromJson(controller.carCategories[index]),
        ),
      ),
    );
  }
}
