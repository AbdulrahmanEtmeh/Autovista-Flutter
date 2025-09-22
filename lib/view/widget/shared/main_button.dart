import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_colors.dart';

class MainButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final double height;
  final double width;
  final Color buttonColor;
  final Color textColor;
  const MainButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.height,
    required this.width,
    this.buttonColor = AppColors.primaryRed,
    this.textColor = AppColors.primaryWhite,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: buttonColor,
      minWidth: width,
      height: height,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Get.width * 0.02),
      ),
      textColor: textColor,
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w700, color: AppColors.primaryWhite),
      ),
    );
  }
}
