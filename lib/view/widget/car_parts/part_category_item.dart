import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/data/model/car_parts_category_model.dart';

import '../../../core/constant/app_links.dart';
import '../../../controller/car_parts/car_parts_categories_controller.dart';
import '../../../core/constant/app_colors.dart';

class PartCategoryItem extends GetView<CarPartsCategoriesControllerImp> {
  final CarPartsCategoryModel carPartsCategoryModel;
  const PartCategoryItem({super.key, required this.carPartsCategoryModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            controller.selectCategory(carPartsCategoryModel.id!);
          },
          child: Container(
            decoration: BoxDecoration(
                color: controller.selectedIndex == carPartsCategoryModel.id!
                    ? AppColors.selectedBrand
                    : AppColors.unSelectedBrand,
                borderRadius: BorderRadius.circular(10)),
            width: Get.width * 0.4,
            height: Get.height * 0.125,
            child: Center(
              child: ClipOval(
                child: SizedBox(
                  height: Get.height * 0.1,
                  width: Get.width * 0.3,
                  child: CachedNetworkImage(
                    imageUrl:
                        '${AppLinks.imageRoot}/${carPartsCategoryModel.photos![0]}',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: Get.height * 0.01),
        SizedBox(
          width: Get.width * 0.35,
          height: Get.height * 0.025,
          child: FittedBox(
            child: Text(
              carPartsCategoryModel.name!,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: AppColors.primaryWhite),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
