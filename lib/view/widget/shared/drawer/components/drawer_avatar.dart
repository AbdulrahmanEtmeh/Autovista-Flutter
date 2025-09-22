import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_image_asset.dart';

class DrawerAvatar extends StatelessWidget {
  const DrawerAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.175 / 2,
      width: Get.width * 0.35 / 2,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.avatarContainer,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.pureBlack,
            width: 2,
          ),
        ),
        child: Center(
          child: ClipOval(
            child: Image.asset(
              AppImageAsset.profileOne,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
