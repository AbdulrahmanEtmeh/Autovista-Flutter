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
  final bool showArrowIcon;
  final IconData? icon;
  final double? iconSize;

  const MainButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.height,
    required this.width,
    this.buttonColor = AppColors.primaryRed,
    this.textColor = AppColors.primaryWhite,
    this.showArrowIcon = false,
    this.icon,
    this.iconSize,
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
        borderRadius: BorderRadius.circular(Get.width * 0.075),
        side: const BorderSide(color: Color(0xff263036), width: 2),
      ),
      textColor: textColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            buttonText,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
          ),
          if (showArrowIcon || icon != null) ...[
            const SizedBox(width: 8),
            Icon(
              icon ?? Icons.arrow_forward,
              size: iconSize ?? Get.width * 0.05,
              color: textColor,
            ),
          ],
        ],
      ),
    );
  }
}
