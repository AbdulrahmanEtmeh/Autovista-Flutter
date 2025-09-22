import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/app_colors.dart';

class DrawerListTile extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final String title;
  const DrawerListTile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: Get.height * 0.025),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.primaryWhite,
              size: Get.width * 0.06,
            ),
            SizedBox(width: Get.width * 0.05),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.primaryWhite,
                    fontWeight: FontWeight.w500,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
