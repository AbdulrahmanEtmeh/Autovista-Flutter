import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';

class AuthBackButton extends StatelessWidget {
  final void Function() onPressed;
  const AuthBackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primaryWhite,
          borderRadius: BorderRadius.circular(50)),
      height: Get.height * 0.055,
      width: Get.height * 0.055,
      child: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.pureBlack,
            size: 25,
          )),
    );
  }
}
