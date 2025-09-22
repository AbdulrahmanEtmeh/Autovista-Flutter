import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/data/model/car_model.dart';

import '../../../core/constant/app_links.dart';
import '../shared/product_card/components/description_container.dart';
import '../shared/product_card/components/name_container.dart';
import '../shared/product_card/components/rating_container.dart';
import '../shared/product_card/components/see_details_container.dart';

class CustomProductCard extends StatelessWidget {
  final CarModel carModel;
  final dynamic controller;
  const CustomProductCard(
      {super.key, required this.carModel, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.25,
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: '${AppLinks.imageRoot}/${carModel.photos![0]}',
                height: Get.height * 0.25,
                width: MediaQuery.of(context).size.width - 30,
                fit: BoxFit.fill,
              ),
            ),
            NameContainer(constraints: constraints, carModel: carModel),
            Positioned(
              right: 0,
              child: RatingContainer(
                  constraints: constraints, rating: carModel.rating!),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: DescriptionContainer(
                  constraints: constraints, carModel: carModel),
            ),
            Positioned(
              right: 0,
              bottom: 15,
              child: SeeDetailsContainer(
                constraints: constraints,
                onTap: () {
                  controller.moveToCarDetails(carModel);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
