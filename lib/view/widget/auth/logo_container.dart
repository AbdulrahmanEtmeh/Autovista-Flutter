import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';

class LogoContainer extends StatelessWidget {
  final String imageAsset;
  final void Function() onTap;
  const LogoContainer(
      {super.key, required this.imageAsset, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.circular(55),
            boxShadow: const [
              BoxShadow(
                color: AppColors.greyShadow,
                blurRadius: 5,
                spreadRadius: 1,
              )
            ]),
        width: 55,
        height: 55,
        child: Container(
          alignment: Alignment.center,
          child: Image.asset(
            imageAsset,
            width: 25,
            height: 25,
          ),
        ),
      ),
    );
  }
}
