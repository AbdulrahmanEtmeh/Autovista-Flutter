import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/app_links.dart';
import '../../../../../data/model/car_model.dart';
import '../../../shared/favorite_icon_container.dart';

class ImageStack extends StatelessWidget {
  final BoxConstraints constraints;
  final CarModel carModel;
  const ImageStack(
      {super.key, required this.constraints, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: '${AppLinks.imageRoot}/${carModel.photos![0]}',
            height: constraints.maxHeight * 0.5,
            width: constraints.maxWidth,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          right: 0,
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                end: Get.width * 0.015, top: Get.height * 0.0075),
            child: FavoriteIconContainer(
              carModel: carModel,
              iconSize: Get.height * 0.025,
              containerSize: Get.height * 0.04,
            ),
          ),
        ),
      ],
    );
  }
}
