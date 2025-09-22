import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_links.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../data/model/car_parts_items_model.dart';
import 'parts_rich_text.dart';

class ContentContainer extends StatelessWidget {
  final CarPartsItemsModel carPartsItemsModel;

  const ContentContainer({super.key, required this.carPartsItemsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.homeContainers,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.primaryRed.withOpacity(0.3),
          width: 1,
        ),
      ),
      height: Get.height * 0.225,
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.025, vertical: Get.height * 0.02),
      child: LayoutBuilder(
        builder: (context, constraints) => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CachedNetworkImage(
                imageUrl:
                    '${AppLinks.imageRoot}/${carPartsItemsModel.photos![0]}',
                height: constraints.maxHeight * 0.5,
                width: constraints.maxWidth * 0.25,
              ),
            ),
            SizedBox(width: constraints.maxWidth * 0.025),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.125,
                  width: constraints.maxWidth * 0.65,
                  child: FittedBox(
                    child: Text(
                      carPartsItemsModel.name!,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.primaryRed,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                PartsRichText(
                  title: 'Price'.tr,
                  value: '\$ ${carPartsItemsModel.price!}',
                  constraints: constraints,
                ),
                PartsRichText(
                  title: 'Part number:'.tr,
                  value: carPartsItemsModel.partNumber!,
                  constraints: constraints,
                ),
                PartsRichText(
                  title: 'Category name:'.tr,
                  value: carPartsItemsModel.categoryName!,
                  constraints: constraints,
                ),
                PartsRichText(
                  title: 'Fits:'.tr,
                  value: carPartsItemsModel.fitsCar!,
                  constraints: constraints,
                ),
                PartsRichText(
                  title: 'Year:'.tr,
                  value: '${carPartsItemsModel.yearCar!}',
                  constraints: constraints,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
