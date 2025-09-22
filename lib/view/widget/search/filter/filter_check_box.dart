import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/search/filter_controller.dart';
import '../../../../core/constant/app_colors.dart';

class FilterCheckBox extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  final String title;
  final String cylinderValue;
  const FilterCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.cylinderValue,
  });

  @override
  Widget build(BuildContext context) {
    FilterController controller = Get.find();
    bool actualValue = value;
    // I switched the logic to use a switch statement for clarity
    switch (cylinderValue) {
      case '4':
        actualValue = controller.cylinderFour;
        break;
      case '6':
        actualValue = controller.cylinderSix;
        break;
      case '8':
        actualValue = controller.cylinderEight;
        break;
      case '12':
        actualValue = controller.cylinderTwelve;
        break;
    }

    return Padding(
      padding: EdgeInsetsDirectional.only(start: Get.width * 0.03),
      child: Row(
        children: [
          Checkbox(
            value: actualValue,
            onChanged: (value) {
              if (value == true) {
                controller.addCylinderValue(cylinderValue);
              } else {
                controller.removeCylinderValue(cylinderValue);
              }
              onChanged?.call(value);
              switch (cylinderValue) {
                case '4':
                  controller.cylinderFour = value!;
                  break;
                case '6':
                  controller.cylinderSix = value!;
                  break;
                case '8':
                  controller.cylinderEight = value!;
                  break;
                case '12':
                  controller.cylinderTwelve = value!;
                  break;
              }
              controller.update();
            },
            activeColor: AppColors.primaryRed,
          ),
          SizedBox(width: Get.width * 0.02),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.carDetailsGrey),
          ),
        ],
      ),
    );
  }
}
