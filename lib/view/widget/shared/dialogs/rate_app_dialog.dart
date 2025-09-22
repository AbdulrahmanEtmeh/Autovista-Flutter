import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_colors.dart';

class RateAppDialog extends StatelessWidget {
  const RateAppDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: Get.height * 0.35,
        width: Get.width * 0.8,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.05, vertical: Get.height * 0.025),
            child: LayoutBuilder(
              builder: (context, constraints) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.2,
                    width: constraints.maxWidth * 0.9,
                    child: FittedBox(
                      child: Text(
                        'Rate Our Car Trading App',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: AppColors.primaryRed,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  SizedBox(
                    height: constraints.maxHeight * 0.3,
                    width: constraints.maxWidth,
                    child: Text(
                      'If you enjoy using our app, please take a moment to rate us.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.pureBlack,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.ratingStar,
                        size: constraints.maxHeight * 0.15,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.ratingStar,
                        size: constraints.maxHeight * 0.15,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.ratingStar,
                        size: constraints.maxHeight * 0.15,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.ratingStar,
                        size: constraints.maxHeight * 0.15,
                      ),
                      Icon(
                        Icons.star_border_outlined,
                        color: AppColors.ratingStar,
                        size: constraints.maxHeight * 0.15,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryRed,
                          foregroundColor: AppColors.primaryWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Ok',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppColors.primaryWhite,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ),
                      SizedBox(width: constraints.maxWidth * 0.05),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'Later',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppColors.primaryRed,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
