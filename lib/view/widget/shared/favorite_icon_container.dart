import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/favorite/favorite_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../data/model/car_model.dart';

class FavoriteIconContainer extends StatelessWidget {
  final CarModel carModel;
  final double iconSize;
  final double containerSize;
  const FavoriteIconContainer({
    super.key,
    required this.carModel,
    required this.iconSize,
    required this.containerSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            color: AppColors.pureBlack.withOpacity(0.8),
            borderRadius: BorderRadius.circular(containerSize)),
        height: containerSize,
        width: containerSize,
        child: GetBuilder<FavoriteController>(
            builder: (controller) => IconButton(
                onPressed: () {
                  if (controller.isFavorite[carModel.id] == 1) {
                    controller.setFavorite(carModel.id!, 0);
                    controller.removeFavorite(carModel.id!);
                  } else {
                    controller.setFavorite(carModel.id!, 1);
                    controller.addFavorite(carModel.id!);
                  }
                },
                padding: EdgeInsets.zero,
                icon: Icon(
                  controller.isFavorite[carModel.id] == 1
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: AppColors.primaryRed,
                  size: iconSize,
                ))));
  }
}
