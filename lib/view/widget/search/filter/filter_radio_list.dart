import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/search/filter_controller.dart';
import '../../../../core/constant/app_colors.dart';

class FilterRadioList extends StatelessWidget {
  final String title;
  final int value;
  const FilterRadioList({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(
      builder: (controller) => RadioListTile(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColors.carDetailsGrey),
        ),
        activeColor: AppColors.primaryRed,
        value: value,
        groupValue: controller.capacity,
        onChanged: (value) {
          controller.capacityChange(value!);
        },
      ),
    );
  }
}
