import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/view/widget/shared/product_card/components/description_container.dart';
import 'package:graduation_project/view/widget/shared/product_card/components/name_container.dart';
import 'package:graduation_project/view/widget/shared/product_card/components/rating_container.dart';

import '../../../../core/constant/app_links.dart';
import '../../../../controller/home/home_page_controller.dart';
import '../../../../data/model/car_model.dart';
import 'components/see_details_container.dart';

class ProductCard extends GetView<HomePageControllerImp> {
  final CarModel carModel;
  const ProductCard({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: '${AppLinks.imageRoot}/${carModel.photos![0]}',
              width: Get.width - Get.width * 0.05,
              height: Get.height * 0.25,
              fit: BoxFit.fill,
            ),
          ),
          NameContainer(
            constraints: constraints,
            carModel: carModel,
          ),
          Positioned(
            right: 0,
            child: RatingContainer(
                constraints: constraints, rating: carModel.rating!),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: DescriptionContainer(
              constraints: constraints,
              carModel: carModel,
            ),
          ),
          Positioned(
            right: 0,
            bottom: constraints.maxHeight * 0.05,
            child: SeeDetailsContainer(
              constraints: constraints,
              onTap: () {
                controller.moveToCarDetails(carModel);
              },
            ),
          ),
        ],
      ),
    );
  }
}
