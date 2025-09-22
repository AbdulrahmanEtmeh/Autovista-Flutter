import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../data/source/static/static.dart';

class DecriptionContainer extends StatelessWidget {
  final int index;
  const DecriptionContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.475,
      width: Get.width * 0.75,
      decoration: BoxDecoration(
        // to make the decription box darker in the second and third pageViews
        color: index == 0
            ? AppColors.pureBlack.withOpacity(0.69)
            : AppColors.pureBlack.withOpacity(0.80),
        borderRadius: BorderRadius.all(
          Radius.circular(Get.width * 0.05),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.03, horizontal: Get.width * 0.05),
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.3,
                child: Text(
                  onBordingList[index].description,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.primaryWhite),
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.01),
              SizedBox(
                height: constraints.maxHeight * 0.09,
                child: Text(
                  'Features:'.tr,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.primaryRed,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.01),
              SizedBox(
                height: constraints.maxHeight * 0.55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    onBordingList[index].features.length,
                    (featuresIndex) => Padding(
                      padding:
                          EdgeInsets.only(bottom: constraints.maxHeight * 0.01),
                      child: Text(
                        '  -  ${onBordingList[index].features[featuresIndex]}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.primaryWhite),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
