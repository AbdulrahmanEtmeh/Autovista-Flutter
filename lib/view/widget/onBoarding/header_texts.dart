import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';
import '../../../data/source/static/static.dart';

class HeaderTexts extends StatelessWidget {
  final int index;
  const HeaderTexts({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: '${onBordingList[index].title}\n',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.primaryRed,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Vollkorn_SC',
                ),
          ),
          TextSpan(
            text: onBordingList[index].subTitle,
            // To make the subtitle color 'black' only in the first pageView
            style: index == 0
                ? Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: AppColors.pureBlack,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Vollkorn_SC',
                    )
                : Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: AppColors.pureWhite,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Vollkorn_SC',
                    ),
          )
        ],
      ),
    );
  }
}
