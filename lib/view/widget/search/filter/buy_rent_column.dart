import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_colors.dart';

class BuyRentColumn extends StatelessWidget {
  final void Function() onTap;
  final Color color;
  final String title;
  final IconData icon;
  const BuyRentColumn({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: SizedBox(
            height: Get.height * 0.075,
            width: Get.width * 0.175,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: AppColors.primaryWhite,
                size: Get.height * 0.035,
              ),
            ),
          ),
        ),
        SizedBox(height: Get.height * 0.005),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.primaryWhite,
                fontWeight: FontWeight.w700,
              ),
        ),
      ],
    );
  }
}
