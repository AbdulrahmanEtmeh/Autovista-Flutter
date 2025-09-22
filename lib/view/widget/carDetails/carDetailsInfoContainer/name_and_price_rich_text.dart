import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/carDetails/car_datails_controller.dart';
import '../../../../core/constant/app_text_styles.dart';

class NameAndPriceRichText extends GetView<CarDatailsControllerImp> {
  const NameAndPriceRichText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: <TextSpan>[
        TextSpan(
          text: '${controller.carModel.name}\n',
          style: AppTextStyles.carDetailsName,
        ),
        TextSpan(
          text: '\$ ${controller.carModel.price}',
          style: AppTextStyles.carDetailsPrice,
        )
      ]),
    );
  }
}
