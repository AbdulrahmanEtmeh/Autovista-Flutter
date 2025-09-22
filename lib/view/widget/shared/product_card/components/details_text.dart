import 'package:flutter/material.dart';

import '../../../../../core/constant/app_colors.dart';

class DetailsText extends StatelessWidget {
  final String text;
  const DetailsText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(color: AppColors.primaryWhite),
    );
  }
}
