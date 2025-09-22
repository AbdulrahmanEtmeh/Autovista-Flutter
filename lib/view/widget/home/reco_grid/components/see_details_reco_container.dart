import 'package:flutter/material.dart';

import '../../../../../core/constant/app_colors.dart';

class SeeDetailsRecoContainer extends StatelessWidget {
  final Function() onTap;
  final BoxConstraints constraints;
  const SeeDetailsRecoContainer(
      {super.key, required this.onTap, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.primaryRed,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomRight: Radius.circular(10),
          ),
        ),
        height: constraints.maxHeight * 0.125,
        width: constraints.maxHeight * 0.175,
        child: Icon(
          Icons.arrow_forward_outlined,
          color: AppColors.primaryWhite,
          size: constraints.maxHeight * 0.075,
        ),
      ),
    );
  }
}
