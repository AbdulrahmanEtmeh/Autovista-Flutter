import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_links.dart';
import 'package:graduation_project/data/model/car_model.dart';

class MyCarCard extends StatelessWidget {
  final CarModel car;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const MyCarCard({
    super.key,
    required this.car,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [
             AppColors.unSelectedBrand,
             AppColors.backGround,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl:
                  '${AppLinks.imageRoot}/${car.photos!.first}',
              width: 115,
              height: 70,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) {
                return Container(
                  width: 115,
                  height: 70,
                  color: AppColors.homeContainers,
                  child: const Icon(
                    Icons.directions_car,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),

          const SizedBox(width: 12),

          // Name & Price
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color:AppColors.primaryWhite,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  '\$${car.price?.toStringAsFixed(0) ?? ''}',
                  style: const TextStyle(
                    color:AppColors.primaryWhite,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // Edit
          IconButton(
            onPressed: onEdit,
            icon: const Icon(
              Icons.edit_square,
              color: AppColors.primaryWhite,
              size: 28,
            ),
          ),

          // Delete
          IconButton(
            onPressed: onDelete,
            icon: const Icon(
              Icons.delete_rounded,
              color: AppColors.primaryRed,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}