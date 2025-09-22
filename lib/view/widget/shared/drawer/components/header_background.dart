import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_image_asset.dart';

class HeaderBackground extends StatelessWidget {
  const HeaderBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.75,
      child: DecoratedBox(
        decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.primaryRed,
                width: 0.1,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.redBlur,
                blurRadius: 1,
                blurStyle: BlurStyle.outer,
              )
            ]),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Transform.rotate(
            angle: 270 * pi / 180,
            child: Transform.scale(
              scale: 0.6,
              child: Image.asset(
                AppImageAsset.drawerBackgroundImage,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
