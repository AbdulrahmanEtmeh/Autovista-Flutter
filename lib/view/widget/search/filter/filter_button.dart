import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_colors.dart';

class FilterButton extends StatelessWidget {
  final Color color;
  final String text;
  final void Function()? onPressed;
  const FilterButton({
    super.key,
    required this.color,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.primaryRed,
          width: 0.5,
        ),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        height: Get.height * 0.06,
        minWidth: Get.width * 0.25,
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.pureWhite, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
