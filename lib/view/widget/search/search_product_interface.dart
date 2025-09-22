import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/search/search_screen_controller.dart';

import '../../../data/model/car_model.dart';
import '../categories_brands_favorite/custom_product_card.dart';

class SearchProductInterface extends GetView<SearchScreenControllerImp> {
  final CarModel carModel;

  const SearchProductInterface({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return CustomProductCard(
      controller: controller,
      carModel: carModel,
    );
  }
}
