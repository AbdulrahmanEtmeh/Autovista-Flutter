import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_text_styles.dart';

import '../../../controller/carDetails/car_datails_controller.dart';
import '../../../core/constant/app_colors.dart';

class CarDetailsListView extends GetView<CarDatailsControllerImp> {
  const CarDetailsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.carDetailsListValue.length,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20, left: 10),
          width: 100,
          decoration: BoxDecoration(
              color: AppColors.backGround,
              borderRadius: BorderRadius.circular(100),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(3, 3),
                  blurStyle: BlurStyle.outer,
                  blurRadius: 18,
                  spreadRadius: 0,
                  color: AppColors.primaryRed,
                ),
                BoxShadow(
                  offset: Offset(-3, -3),
                  blurStyle: BlurStyle.outer,
                  blurRadius: 9,
                  spreadRadius: 0,
                  color: AppColors.greyBlur,
                )
              ]),
          child: Container(
            margin:
                const EdgeInsets.only(left: 5, right: 5, bottom: 15, top: 10),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  alignment: Alignment.topRight,
                  child: Text(
                    controller.carDetailsListUnit[index],
                    style: AppTextStyles.carDetailsUnitAndTitle,
                  ),
                ),
                Text(
                  controller.carDetailsListValue[index],
                  style: AppTextStyles.carDetailsValue,
                ),
                Text(
                  controller.carDetailsListTitle[index],
                  style: AppTextStyles.carDetailsUnitAndTitle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
