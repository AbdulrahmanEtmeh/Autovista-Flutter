import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';

class ComponentContainer extends StatelessWidget {
  final Widget child;
  final double height;
  const ComponentContainer(
      {super.key, required this.height, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.primaryWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Get.width * 0.20),
          ),
        ),
        child: child);
  }
}
