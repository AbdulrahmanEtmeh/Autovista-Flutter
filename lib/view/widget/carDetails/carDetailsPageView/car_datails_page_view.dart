import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/view/widget/carDetails/carDetailsPageView/car_details_page_indicator.dart';
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
                        child: const Icon(
                          Icons.directions_car,
                          color: AppColors.primaryWhite,
                          size: 50,
                        ),
                      ),
                    )
                  : Container(
                      color: AppColors.homeContainers,
                      child: const Icon(
                        Icons.directions_car,
                        color: AppColors.primaryWhite,
                        size: 50,
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
              iconSize: 30,
              containerOpacity: 0.6,
            ),
          ),
          Positioned(
            top: 10,
            right: 15,
            child: FavoriteIconContainer(
              carModel: controller.carModel,
              iconSize: 28,
              containerSize: 45,
            ),
          ),
          // Positioned(
          //   bottom: 12,
          //   left: 0,
          //   right: 0,
          //   child: CarDetailsPageIndicator(),
          // ),
        ],
      ),
    );
  }
}