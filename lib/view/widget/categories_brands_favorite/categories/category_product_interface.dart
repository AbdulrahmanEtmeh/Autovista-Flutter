import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/view/widget/categories_brands_favorite/custom_product_card.dart';

import '../../../../controller/categories_screen_controller.dart';
import '../../../../data/model/car_model.dart';

class CategoryProductInterface extends GetView<CategoriesScreenControllerImp> {
  final CarModel carModel;
  const CategoryProductInterface({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return CustomProductCard(
      controller: controller,
      carModel: carModel,
    );
  }
}
