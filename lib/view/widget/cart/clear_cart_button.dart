import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';

class ClearCartButton extends StatelessWidget {
  final void Function() onPressed;
  const ClearCartButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.delete_outlined,
        color: AppColors.primaryRed,
        size: Get.height * 0.04,
      ),
    );
  }
}
