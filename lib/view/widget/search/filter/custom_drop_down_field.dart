import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_colors.dart';

class CustomDropDownField extends StatelessWidget {
  final void Function(dynamic)? onChanged;
  final dynamic value;
  final List<DropdownMenuItem<Object>>? items;
  const CustomDropDownField({
    super.key,
    required this.onChanged,
    required this.value,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: AppColors.primaryRed),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: Get.height * 0.015, horizontal: Get.width * 0.025),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.primaryRed.withOpacity(0.2),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.primaryRed.withOpacity(0.2),
            width: 1,
          ),
        ),
        filled: true,
        fillColor: AppColors.homeContainers,
      ),
      value: value,
      items: items,
      onChanged: onChanged,
    );
  }
}
