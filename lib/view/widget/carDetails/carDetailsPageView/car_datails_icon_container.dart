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
    return Container(
      decoration: BoxDecoration(
        color: AppColors.pureBlack.withOpacity(containerOpacity),
        borderRadius: BorderRadius.circular(50),
      ),
      height: 50,
      width: 50,
      child: IconButton(
          onPressed: onPressedIcons,
          icon: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          )),
    );
  }
}
