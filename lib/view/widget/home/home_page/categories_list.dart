import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/home/home_page_controller.dart';
import 'package:graduation_project/data/model/car_categories_model.dart';

import 'category_item.dart';

class CategoriesList extends GetView<HomePageControllerImp> {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.125,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.carCategories.length,
        separatorBuilder: (context, index) => SizedBox(width: Get.width * 0.03),
        itemBuilder: (context, index) => CategoryItem(
          selectedCategory: index,
          carCategoriesModel:
              CarCategoriesModel.fromJson(controller.carCategories[index]),
        ),
      ),
    );
  }
}
