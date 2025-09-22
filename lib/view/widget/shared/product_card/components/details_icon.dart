import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/app_colors.dart';

class DetailsIcon extends StatelessWidget {
  final IconData icon;
  const DetailsIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(end: Get.width * 0.01),
      child: Icon(
        icon,
        color: AppColors.primaryRed,
        size: Get.height * 0.025,
      ),
    );
  }
}
