import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/data/model/car_brands_model.dart';

import '../../../../controller/brands_screen_controller.dart';
import 'brands_list.dart';

class ListBrands extends GetView<BrandsScreenControllerImp> {
  const ListBrands({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.05,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.carBrands.length,
        separatorBuilder: (context, index) =>
            SizedBox(width: Get.width * 0.025),
        itemBuilder: (context, index) => BrandsList(
          selectedBrand: index,
          carBrandsModel: CarBrandsModel.fromJson(controller.carBrands[index]),
        ),
      ),
    );
  }
}
