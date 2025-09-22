import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/home/home_page_controller.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../data/model/car_categories_model.dart';

class CategoryItem extends GetView<HomePageControllerImp> {
  final CarCategoriesModel carCategoriesModel;
  final int selectedCategory;
  const CategoryItem(
      {super.key,
      required this.carCategoriesModel,
      required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            Future.microtask(
              () {
                controller.moveToCategries(
                  controller.carCategories,
                  selectedCategory,
                  carCategoriesModel.id!,
                );
              },
            );
          },
          child: SizedBox(
            height: Get.height * 0.08,
            width: Get.width * 0.175,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.homeContainers,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: AppColors.primaryRed.withOpacity(0.4),
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.electric_car,
                color: AppColors.primaryRed.withOpacity(0.7),
                size: Get.height * 0.04,
              ),
            ),
          ),
        ),
        Text(
          carCategoriesModel.name!,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.primaryRed,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
