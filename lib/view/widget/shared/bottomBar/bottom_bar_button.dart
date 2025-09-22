import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';

class BottomBarButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final IconData icon;
  final bool active;
  const BottomBarButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.icon,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color:
                active == true ? AppColors.primaryRed : AppColors.primaryWhite,
            size: 28,
          ),
          Text(
            title,
            style: TextStyle(
              color: active == true
                  ? AppColors.primaryRed
                  : AppColors.primaryWhite,
            ),
          )
        ],
      ),
    );
  }
}
