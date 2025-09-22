import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_text_styles.dart';

class HomePricePredictionContainer extends StatelessWidget {
  final void Function() onTap;
  const HomePricePredictionContainer({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.primaryRed,
          borderRadius: BorderRadius.circular(15),
        ),
        height: 175,
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Want help predictiong the price of your car?',
              style: AppTextStyles.homePricePreTitle,
            ),
            Row(
              children: [
                InkWell(
                  onTap: onTap,
                  child: const Row(
                    children: [
                      Text(
                        "Let's try",
                        style: AppTextStyles.homePricePreUnderline,
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.primaryWhite,
                        size: 20,
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 130),
                // Image.asset(
                //   // AppImageAsset.pricePredictoinImage,
                //   height: 75,
                //   width: 75,
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
