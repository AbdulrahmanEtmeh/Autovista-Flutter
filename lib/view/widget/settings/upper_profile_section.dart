import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/view/widget/settings/avatar_container.dart';

import '../../../controller/settings/settings_screen_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_image_asset.dart';

class UpperProfileSection extends GetView<SettingsScreenControllerImp> {
  const UpperProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: Get.height * 0.275,
          width: Get.width,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Transform.rotate(
              angle: 90 * pi / 180,
              child: Transform.scale(
                scale: 0.6,
                child: Image.asset(AppImageAsset.profileBackgroundImage),
              ),
            ),
          ),
        ),
        Positioned(
          left: Get.width * 0.05,
          top: Get.height * 0.05,
          child: SizedBox(
            height: Get.width * 0.11,
            width: Get.height * 0.05,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.backGround,
                shape: BoxShape.circle,
              ),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.primaryRed,
                  size: Get.height * 0.025,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: -Get.height * 0.09,
          child: Column(
            children: [
              const AvatarContainer(),
              SizedBox(height: Get.height * 0.005),
              Text(
                controller.userName!,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: AppColors.pureWhite, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ],
    );
  }
}
