import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.check_circle_outline_outlined,
      size: Get.height * 0.25,
      color: AppColors.primaryRed,
    );
  }
}
