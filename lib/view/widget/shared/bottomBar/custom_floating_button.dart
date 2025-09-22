import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';

class CustomFloatingButton extends StatelessWidget {
  final void Function() onPressed;
  const CustomFloatingButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 75,
      child: FloatingActionButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        backgroundColor: AppColors.primaryRed,
        child: const Icon(
          Icons.shopping_cart_outlined,
          color: AppColors.primaryWhite,
          size: 35,
        ),
      ),
    );
  }
}
