import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';

class RedLinesDesignRow extends StatelessWidget {
  const RedLinesDesignRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: AppColors.primaryRed,
          width: Get.width * 0.15,
          height: double.infinity,
        ),
        SizedBox(
          width: Get.width * 0.05,
        ),
        Container(
          color: AppColors.primaryRed,
          width: Get.width * 0.15,
          height: double.infinity,
        )
      ],
    );
  }
}
