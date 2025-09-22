import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';

class TitleText extends StatelessWidget {
  final String text;
  const TitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(color: AppColors.primaryWhite, fontWeight: FontWeight.bold),
    );
  }
}
