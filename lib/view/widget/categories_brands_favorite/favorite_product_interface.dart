import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/favorite/my_favorite_controller.dart';

import '../../../data/model/car_model.dart';
import 'custom_product_card.dart';

class FavoriteProductInterface extends GetView<MyFavoriteController> {
  final CarModel carModel;
  const FavoriteProductInterface({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return CustomProductCard(
      controller: controller,
      carModel: carModel,
    );
  }
}
