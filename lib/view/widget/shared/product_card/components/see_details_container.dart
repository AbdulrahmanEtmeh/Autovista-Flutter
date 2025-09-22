import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/app_colors.dart';

class SeeDetailsContainer extends StatelessWidget {
  final BoxConstraints constraints;
  final Function() onTap;
  const SeeDetailsContainer(
      {super.key, required this.constraints, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: constraints.maxHeight * 0.175,
        width: Get.width * 0.3,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: AppColors.pureBlack.withOpacity(0.6),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'See Details'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.primaryWhite),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                color: AppColors.primaryWhite,
                size: Get.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
