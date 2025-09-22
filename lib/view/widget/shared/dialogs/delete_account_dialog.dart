import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_image_asset.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  AppImageAsset.redWarning,
                  width: constraints.maxWidth * 0.15,
                  height: constraints.maxWidth * 0.15,
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.05),
              SizedBox(
                height: constraints.maxHeight * 0.2,
                width: constraints.maxWidth,
                child: Text(
                  'You requested to delete your account, Are you sure?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.pureBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: constraints.maxHeight * 0.05,
                      ),
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.075),
                child: Text(
                  "By deleting your account you'll lose:",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.pureBlack,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '* All your orders and history',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.pureBlack,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      '* All your saved cars',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.pureBlack,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      '* All your saved searches',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.pureBlack,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.pureBlack,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Delete',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: AppColors.pureWhite,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(width: constraints.maxWidth * 0.05),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your delete account logic here
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryRed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: AppColors.pureWhite,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
