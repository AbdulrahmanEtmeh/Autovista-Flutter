import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';

class HomeSearchRedContainer extends StatelessWidget {
  final String text;
  final BoxConstraints boxConstraints;
  const HomeSearchRedContainer({
    super.key,
    required this.text,
    required this.boxConstraints,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryRed.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      height: boxConstraints.maxHeight * 0.2,
      width: boxConstraints.maxWidth * 0.15,
      child: Center(
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.pureWhite),
        ),
      ),
    );
  }
}
