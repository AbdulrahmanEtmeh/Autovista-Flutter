import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? fieldController;
  final String hintText;

  const CustomTextField({
    super.key,
    this.fieldController,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: Get.height * 0.015, horizontal: Get.width * 0.05),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.primaryRed.withOpacity(0.2),
              width: 1,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.primaryRed.withOpacity(0.2),
              width: 1,
            )),
        filled: true,
        fillColor: AppColors.homeContainers,
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: AppColors.greyBlur),
      ),
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: AppColors.primaryWhite),
    );
  }
}
