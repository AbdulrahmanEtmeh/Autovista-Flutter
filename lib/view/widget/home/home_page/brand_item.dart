import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_links.dart';
import '../../../../controller/home/home_page_controller.dart';
import '../../../../data/model/car_brands_model.dart';

class BrandItem extends GetView<HomePageControllerImp> {
  final CarBrandsModel carBrandsModel;
  final int selectedBrand;
  final int index;
  const BrandItem({
    super.key,
    required this.carBrandsModel,
    required this.selectedBrand,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Future.microtask(
          () {
            controller.moveToBrands(
              controller.carBrands,
              selectedBrand,
              carBrandsModel.id!,
            );
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.025),
        child: CachedNetworkImage(
          imageUrl: '${AppLinks.imageRoot}/${carBrandsModel.photos![0]}',
          width: Get.width * 0.125,
        ),
      ),
    );
  }
}
