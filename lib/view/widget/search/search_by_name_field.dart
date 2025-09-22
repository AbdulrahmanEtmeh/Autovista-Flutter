import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';

class SearchByNameField extends StatelessWidget {
  final void Function(String) onChanged;
  final void Function() onPressedSearch;
  final TextEditingController myController;
  const SearchByNameField({
    super.key,
    required this.onPressedSearch,
    required this.onChanged,
    required this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: AppColors.primaryWhite,
            fontWeight: FontWeight.w500,
          ),
      onChanged: onChanged,
      controller: myController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: Get.height * 0.018),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.primaryRed.withOpacity(0.2),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.primaryRed.withOpacity(0.2),
            width: 1,
          ),
        ),
        filled: true,
        fillColor: AppColors.homeContainers,
        prefixIcon: Container(
          padding: EdgeInsets.only(left: Get.width * 0.02),
          child: IconButton(
            onPressed: onPressedSearch,
            icon: const Icon(Icons.search),
            color: AppColors.primaryWhite.withOpacity(0.5),
          ),
        ),
        hintText: 'Find your car ...'.tr,
        hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.pureWhite.withOpacity(0.5),
            ),
      ),
    );
  }
}
