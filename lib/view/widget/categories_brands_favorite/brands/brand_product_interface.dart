import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/brands_screen_controller.dart';

import '../../../../data/model/car_model.dart';
import '../custom_product_card.dart';

class BrandProductInterface extends GetView<BrandsScreenControllerImp> {
  final CarModel carModel;
  const BrandProductInterface({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return CustomProductCard(
      controller: controller,
      carModel: carModel,
    );
  }
}
