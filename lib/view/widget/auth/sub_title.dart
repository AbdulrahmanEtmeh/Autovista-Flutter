import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';

class SubTitle extends StatelessWidget {
  final String text;
  const SubTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(color: AppColors.authText, fontWeight: FontWeight.w700),
    );
  }
}
