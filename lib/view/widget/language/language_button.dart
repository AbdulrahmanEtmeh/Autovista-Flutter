import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';

class LanguageButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;
  const LanguageButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Get.width * 0.03),
        boxShadow: const [
          BoxShadow(
            color: AppColors.redBlur,
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColors.primaryWhite,
        minWidth: Get.width * 0.55,
        height: Get.height * 0.06,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Get.width * 0.03),
        ),
        textColor: AppColors.pureWhite,
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppColors.pureBlack, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
