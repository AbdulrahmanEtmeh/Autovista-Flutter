import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/search/search_screen_controller.dart';

import '../../../core/constant/app_colors.dart';

class FiltrationButton extends GetView<SearchScreenControllerImp> {
  const FiltrationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.onFiltrationButtonPressed();
      },
      child: Container(
        height: Get.height * 0.06,
        width: Get.width * 0.12,
        decoration: BoxDecoration(
          color: AppColors.homeContainers,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: AppColors.primaryRed.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Icon(
          Icons.filter_list,
          color: AppColors.primaryRed,
          size: Get.height * 0.03,
        ),
      ),
    );
  }
}
