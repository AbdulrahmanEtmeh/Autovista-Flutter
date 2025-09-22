import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';

class NavigationText extends StatelessWidget {
  final String firstText;
  final String secondtext;
  final void Function() onTap;
  const NavigationText(
      {super.key,
      required this.firstText,
      required this.secondtext,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: Get.height * 0.019),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            secondtext,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.primaryRed,
                fontWeight: FontWeight.w700,
                fontSize: Get.height * 0.019),
          ),
        ),
      ],
    );
  }
}
