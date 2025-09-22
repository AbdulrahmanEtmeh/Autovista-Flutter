import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/app_colors.dart';

class RatingContainer extends StatelessWidget {
  final BoxConstraints constraints;
  final double rating;
  const RatingContainer(
      {super.key, required this.constraints, required this.rating});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight * 0.175,
      width: Get.width * 0.225,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.pureBlack.withOpacity(0.6),
          borderRadius:
              const BorderRadius.only(bottomLeft: Radius.circular(35)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.star,
              color: AppColors.ratingStar,
              size: constraints.maxHeight * 0.1,
            ),
            Text(
              '$rating',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.primaryWhite, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
