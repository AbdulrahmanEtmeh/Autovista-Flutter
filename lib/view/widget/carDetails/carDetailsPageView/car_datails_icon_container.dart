import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';

class CarDetailsIconContainer extends StatelessWidget {
  final void Function() onPressedIcons;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final double containerOpacity;

  const CarDetailsIconContainer({
    super.key,
    required this.onPressedIcons,
    required this.icon,
    required this.iconColor,
    required this.iconSize,
    required this.containerOpacity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedIcons,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: AppColors.primaryWhite, 
          shape: BoxShape.circle,
         
        ),
        child: Icon(
          icon,
          color: AppColors.primaryRed, 
          size: iconSize,
         
        ),
      ),
    );
  }
}