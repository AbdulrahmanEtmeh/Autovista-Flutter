import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';

class PartsRichText extends StatelessWidget {
  final String title;
  final String value;
  final BoxConstraints constraints;
  const PartsRichText(
      {super.key,
      required this.title,
      required this.value,
      required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: constraints.maxHeight * 0.02),
      child: RichText(
        text: TextSpan(children: <TextSpan>[
          TextSpan(
            text: title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.carDetailsGrey,
                  fontWeight: FontWeight.w500,
                ),
          ),
          TextSpan(
            text: value,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.primaryWhite,
                  fontWeight: FontWeight.w500,
                ),
          )
        ]),
      ),
    );
  }
}
