import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';

class FieldTitle extends StatelessWidget {
  final String text;
  const FieldTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.pureWhite,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
