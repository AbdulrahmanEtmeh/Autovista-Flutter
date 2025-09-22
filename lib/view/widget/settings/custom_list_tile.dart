import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color titleColor;
  final Widget trailing;
  final VoidCallback onTap;
  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleColor = AppColors.primaryWhite,
    this.trailing = const Icon(
      Icons.arrow_forward_ios,
      color: AppColors.greyBlur,
    ),
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Get.height * 0.01),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: titleColor, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.greyBlur, fontWeight: FontWeight.w500),
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}
