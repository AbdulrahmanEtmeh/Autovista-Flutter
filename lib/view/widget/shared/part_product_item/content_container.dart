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

  String _resolveImageUrl() {
    final images = carPartsItemsModel.photos;
    if (images == null || images.isEmpty) {
      return '';
    }

    final first = images.first.trim();
    if (first.isEmpty) {
      return '';
    }

    if (first.startsWith('http://') || first.startsWith('https://')) {
      return first;
    }

    return '${AppLinks.imageRoot}/$first';
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = _resolveImageUrl();
    final hasQuantity = (carPartsItemsModel.quantity ?? 0) > 0;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.homeContainers,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.primaryRed.withOpacity(0.3),
          width: 1,
        ),
      ),
      height: Get.height * (hasQuantity ? 0.27 : 0.225),
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.025, vertical: Get.height * 0.02),
      child: LayoutBuilder(
        builder: (context, constraints) => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: imageUrl.isEmpty
                  ? const Icon(Icons.image_not_supported)
                  : CachedNetworkImage(
                      imageUrl: imageUrl,
                      height: constraints.maxHeight * 0.5,
                      width: constraints.maxWidth * 0.25,
                      fit: BoxFit.contain,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.image_not_supported),
                    ),
            ),
            SizedBox(width: constraints.maxWidth * 0.025),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    carPartsItemsModel.name ?? 'Part',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.primaryRed,
                        fontWeight: FontWeight.bold),
                  ),
                  PartsRichText(
                    title: 'Price: '.tr,
                    value: '\$ ${carPartsItemsModel.price ?? '0'}',
                    constraints: constraints,
                  ),
                  if (hasQuantity)
                    PartsRichText(
                      title: 'Quantity: '.tr,
                      value: '${carPartsItemsModel.quantity}',
                      constraints: constraints,
                    ),
                  PartsRichText(
                    title: 'Part number: '.tr,
                    value: carPartsItemsModel.partNumber ?? '-',
                    constraints: constraints,
                  ),
                  PartsRichText(
                    title: 'Category name: '.tr,
                    value: carPartsItemsModel.categoryName ?? '-',
                    constraints: constraints,
                  ),
                  PartsRichText(
                    title: 'Fits: '.tr,
                    value: carPartsItemsModel.fitsCar ?? '-',
                    constraints: constraints,
                  ),
                  PartsRichText(
                    title: 'Year: '.tr,
                    value: carPartsItemsModel.yearCar?.toString() ?? '-',
                    constraints: constraints,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
