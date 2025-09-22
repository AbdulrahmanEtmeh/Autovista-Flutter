import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../data/model/car_model.dart';
import 'details_icon.dart';
import 'details_text.dart';

class DescriptionContainer extends StatelessWidget {
  final BoxConstraints constraints;
  final CarModel carModel;
  const DescriptionContainer(
      {super.key, required this.constraints, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight * 0.325,
      width: Get.width * 0.6,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.pureBlack.withOpacity(0.6),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const DetailsIcon(icon: Icons.groups_outlined),
                    DetailsText(text: '${carModel.capacity} People')
                  ],
                ),
                Row(
                  children: [
                    const DetailsIcon(icon: Icons.oil_barrel_outlined),
                    DetailsText(text: '${carModel.consumption}')
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const DetailsIcon(icon: Icons.transform_outlined),
                    DetailsText(text: '${carModel.gearType}')
                  ],
                ),
                const Row(
                  children: [
                    DetailsIcon(icon: Icons.flash_on_outlined),
                    DetailsText(text: 'Hybrid')
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
