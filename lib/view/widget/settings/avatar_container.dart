import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/settings/settings_screen_controller.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_image_asset.dart';

class AvatarContainer extends GetView<SettingsScreenControllerImp> {
  const AvatarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.avatarContainer,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.pureBlack,
          width: 2,
        ),
      ),
      height: Get.height * 0.16,
      width: Get.width * 0.35,
      child: Center(
        child: ClipOval(
          child: Image.asset(
            AppImageAsset.profileOne,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
