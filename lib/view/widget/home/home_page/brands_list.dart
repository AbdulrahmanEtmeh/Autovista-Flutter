import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/data/model/car_brands_model.dart';

import '../../../../controller/home/home_page_controller.dart';
import '../../../../core/constant/app_colors.dart';
import 'brand_item.dart';

class BrandsList extends GetView<HomePageControllerImp> {
  const BrandsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.085,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.homeContainers,
          border: Border(
            bottom: BorderSide(
              color: AppColors.primaryRed.withOpacity(0.4),
              width: 1,
            ),
            top: BorderSide(
              color: AppColors.primaryRed.withOpacity(0.4),
              width: 1,
            ),
          ),
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.carBrands.length,
          itemBuilder: (context, index) => BrandItem(
            index: index,
            selectedBrand: index,
            carBrandsModel: CarBrandsModel.fromJson(
              controller.carBrands[index],
            ),
          ),
        ),
      ),
    );
  }
}
