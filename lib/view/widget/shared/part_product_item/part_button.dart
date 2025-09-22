import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_colors.dart';

class PartButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  const PartButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.primaryRed,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            topLeft: Radius.circular(25),
          )),
      height: Get.height * 0.06,
      width: Get.width * 0.15,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: AppColors.primaryWhite,
          size: Get.height * 0.03,
        ),
      ),
    );
  }
}
