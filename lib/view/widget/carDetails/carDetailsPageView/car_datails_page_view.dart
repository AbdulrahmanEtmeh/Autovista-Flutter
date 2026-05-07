import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/app_links.dart';
import '../../../../controller/car_datails_controller.dart';
import '../../../../core/constant/app_colors.dart';
import '../../shared/favorite_icon_container.dart';
import 'car_datails_icon_container.dart';

class CarDetailsPageView extends GetView<CarDatailsControllerImp> {
  const CarDetailsPageView({super.key});
  @override
  Widget build(BuildContext context) {
    final photos = controller.carModel.photos ?? <String>[];
    final itemCount = photos.isEmpty ? 1 : photos.length;
    return SizedBox(
      height: Get.height * 0.5,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return photos.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: '${AppLinks.imageRoot}/${photos[index]}',
                      width: Get.width,
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                      errorWidget: (context, url, error) => Container(
                        color: AppColors.homeContainers,
                        child: Icon(
                          Icons.directions_car,
                          color: AppColors.primaryWhite,
                          size: Get.width * 0.1,
                        ),
                      ),
                    )
                  : Container(
                      color: AppColors.homeContainers,
                      child: Icon(
                        Icons.directions_car,
                        color: AppColors.primaryWhite,
                        size: Get.width * 0.1,
                      ),
                    );
            },
          ),
          Positioned(
            top: 10,
            left: 15,
            child: CarDetailsIconContainer(
              onPressedIcons: controller.moveToPrevScreen,
              icon: Icons.arrow_back,
              iconColor: AppColors.primaryRed,
              iconSize: Get.width * 0.065,
              containerOpacity: 0.6,
            ),
          ),
          Positioned(
            top: 10,
            right: 15,
            child: FavoriteIconContainer(
              carModel: controller.carModel,
              iconSize: Get.width * 0.065,
              containerSize: Get.width * 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
