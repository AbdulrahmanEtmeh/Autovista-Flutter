import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/home/home_page_controller.dart';
import 'package:graduation_project/data/model/car_model.dart';
import 'package:graduation_project/view/widget/home/reco_grid/components/reco_grid_item.dart';

import '../../../../controller/favorite/favorite_controller.dart';

class RecoGrid extends GetView<HomePageControllerImp> {
  const RecoGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FavoriteController controllerFav = Get.find();
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Get.width * 0.04,
        mainAxisSpacing: Get.height * 0.02,
        mainAxisExtent: Get.height * 0.275,
      ),
      itemCount: controller.cars.length,
      itemBuilder: (context, index) {
        controllerFav.isFavorite[controller.cars[index]['id']] =
            controller.cars[index]['is_favorite'];
        return RecoGridItem(
          carModel: CarModel.fromJson(controller.cars[index]),
        );
      },
    );
  }
}
