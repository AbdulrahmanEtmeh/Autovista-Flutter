import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';

class SectionName extends StatelessWidget {
  final String text;
  const SectionName({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppColors.primaryWhite,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
