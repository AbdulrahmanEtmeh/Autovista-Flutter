import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/data/model/car_brands_model.dart';

import '../../../core/constant/app_links.dart';
import '../../../controller/car_parts/car_parts_brands_controller.dart';
import '../../../core/constant/app_colors.dart';

class PartBrandItem extends GetView<CarPartsBrandsControllerImp> {
  final CarBrandsModel carBrandsModel;
  const PartBrandItem({
    super.key,
    required this.carBrandsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.selectCategory(carBrandsModel.id!);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: controller.selectedIndex == carBrandsModel.id!
                ? AppColors.selectedBrand
                : AppColors.unSelectedBrand,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: ClipOval(
            child: SizedBox(
              height: Get.height * 0.15,
              width: Get.width * 0.25,
              child: CachedNetworkImage(
                imageUrl: '${AppLinks.imageRoot}/${carBrandsModel.photos![0]}',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
