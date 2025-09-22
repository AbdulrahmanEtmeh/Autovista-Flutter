import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_links.dart';
import '../../../controller/carDetails/car_datails_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../shared/favorite_icon_container.dart';
import 'carDetailsPageView/car_datails_icon_container.dart';

class CarDetailsPageView extends GetView<CarDatailsControllerImp> {
  const CarDetailsPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      child: PageView.builder(
        controller: controller.pageController,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            color: AppColors.backGround,
            height: 400,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: CachedNetworkImage(
                      imageUrl:
                          '${AppLinks.imageRoot}/${controller.carModel.photos![index]}',
                      height: 400,
                      width: 400,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                  child: CarDetailsIconContainer(
                    onPressedIcons: controller.moveToPrevScreen,
                    icon: Icons.arrow_back,
                    iconColor: AppColors.pureWhite,
                    iconSize: 25,
                    containerOpacity: 0.6,
                  ),
                )),
                Positioned(
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 40),
                      child: FavoriteIconContainer(
                        carModel: controller.carModel,
                        iconSize: 30,
                        containerSize: 50,
                      ),
                    )),
                Positioned(
                    left: 5,
                    top: 175,
                    child: CarDetailsIconContainer(
                      onPressedIcons: () {},
                      icon: Icons.arrow_back_ios,
                      iconColor: AppColors.primaryRed,
                      iconSize: 35,
                      containerOpacity: 0.85,
                    )),
                Positioned(
                    right: -2,
                    top: 175,
                    child: CarDetailsIconContainer(
                      onPressedIcons: () {},
                      icon: Icons.arrow_forward_ios,
                      iconColor: AppColors.primaryRed,
                      iconSize: 35,
                      containerOpacity: 0.85,
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
