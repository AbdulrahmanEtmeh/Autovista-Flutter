import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/brands_screen_controller.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../data/model/car_brands_model.dart';

class BrandsList extends GetView<BrandsScreenControllerImp> {
  final CarBrandsModel carBrandsModel;
  final int selectedBrand;
  const BrandsList(
      {super.key, required this.carBrandsModel, required this.selectedBrand});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Future.microtask(
          () {
            controller.changeBrand(selectedBrand, carBrandsModel.id!);
          },
        );
      },
      child: GetBuilder<BrandsScreenControllerImp>(
        builder: (controller) => Container(
          width: Get.width * 0.325,
          alignment: Alignment.center,
          decoration: controller.selectedBrand == selectedBrand
              ? const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.primaryRed, width: 2),
                  ),
                )
              : null,
          child: Text(
            carBrandsModel.name!,
            style: controller.selectedBrand == selectedBrand
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
