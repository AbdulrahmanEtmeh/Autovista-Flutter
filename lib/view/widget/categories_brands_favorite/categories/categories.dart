import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/categories_screen_controller.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../data/model/car_categories_model.dart';

class Categories extends GetView<CategoriesScreenControllerImp> {
  final CarCategoriesModel carCategoriesModel;
  final int selectedCategory;
  const Categories(
      {super.key,
      required this.carCategoriesModel,
      required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Future.microtask(
          () {
            controller.changeCategory(selectedCategory, carCategoriesModel.id!);
          },
        );
      },
      child: GetBuilder<CategoriesScreenControllerImp>(
        builder: (controller) => Container(
          width: Get.width * 0.325,
          alignment: Alignment.center,
          decoration: controller.selectedCategory == selectedCategory
              ? const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.primaryRed, width: 2),
                  ),
                )
              : null,
          child: Text(
            carCategoriesModel.name!,
            style: controller.selectedCategory == selectedCategory
                ? Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.primaryWhite, fontWeight: FontWeight.bold)
                : Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.primaryWhite, fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
