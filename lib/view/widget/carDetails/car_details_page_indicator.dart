import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../controller/carDetails/car_datails_controller.dart';
import '../../../core/constant/app_colors.dart';

class CarDetailsPageIndicator extends GetView<CarDatailsControllerImp> {
  const CarDetailsPageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 4,
        effect: const JumpingDotEffect(
          activeDotColor: AppColors.primaryRed,
          dotColor: AppColors.primaryWhite,
          dotHeight: 12,
          dotWidth: 12,
        ),
      ),
    );
  }
}
