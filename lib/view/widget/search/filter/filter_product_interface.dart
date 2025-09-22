import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/search/filter_result_controller.dart';
import '../../../../data/model/car_model.dart';
import '../../categories_brands_favorite/custom_product_card.dart';

class FilterProductInterface extends GetView<FilterResultController> {
  final CarModel carModel;
  const FilterProductInterface({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return CustomProductCard(
      carModel: carModel,
      controller: controller,
    );
  }
}
