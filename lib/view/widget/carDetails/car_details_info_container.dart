import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_text_styles.dart';
import 'package:graduation_project/view/widget/shared/main_button.dart';

import '../../../controller/carDetails/car_datails_controller.dart';
import '../../../core/constant/app_colors.dart';
import 'carDetailsInfoContainer/name_and_price_rich_text.dart';

class CarDetailsInfoContainer extends GetView<CarDatailsControllerImp> {
  const CarDetailsInfoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
      decoration: BoxDecoration(
          color: AppColors.homeContainers,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
          border: Border(
              top: BorderSide(
                  color: AppColors.primaryRed.withOpacity(0.3), width: 2))),
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const NameAndPriceRichText(),
              Row(children: [
                Row(
                  children: controller.ratingStars(controller.carModel.rating!),
                ),
                const SizedBox(width: 10),
                Text(
                  '${controller.carModel.rating}',
                  style: AppTextStyles.carDetailsRating,
                )
              ])
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'data data data data data data data data data data data data data data data data data data data',
            style: AppTextStyles.carDetailsDescription,
          ),
          const SizedBox(height: 20),
          MainButton(
            buttonText: 'Add To Cart',
            height: Get.height * 0.05,
            onPressed: () {},
            width: Get.width,
          )
        ],
      ),
    );
  }
}
