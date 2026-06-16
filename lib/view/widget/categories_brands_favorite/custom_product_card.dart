import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/data/model/car_model.dart';

import '../../../core/constant/app_links.dart';
import '../shared/product_card/components/description_container.dart';
import '../shared/product_card/components/name_container.dart';
import '../shared/product_card/components/rating_container.dart';
import '../shared/product_card/components/see_details_container.dart';

class CustomProductCard extends StatelessWidget {
  final CarModel carModel;
  final dynamic controller;
  const CustomProductCard(
      {super.key, required this.carModel, required this.controller});

  @override
  Widget build(BuildContext context) {
    // Safe photo URL — null or empty list falls back to placeholder
    final hasPhoto =
        carModel.photos != null && carModel.photos!.isNotEmpty;

    return SizedBox(
      height: Get.height * 0.25,
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            // ── Car Image ──────────────────────────────────────────────────
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: hasPhoto
                  ? CachedNetworkImage(
                      imageUrl:
                          '${AppLinks.imageRoot}/${carModel.photos![0]}',
                      height: Get.height * 0.25,
                      width: MediaQuery.of(context).size.width - 30,
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) =>
                          _PlaceholderImage(constraints: constraints),
                    )
                  : _PlaceholderImage(constraints: constraints),
            ),

            // ── Name ───────────────────────────────────────────────────────
            NameContainer(constraints: constraints, carModel: carModel),

            // ── Rating — only shown when not null ──────────────────────────
            if (carModel.rating != null)
              Positioned(
                right: 0,
                child: RatingContainer(
                  constraints: constraints,
                  rating: carModel.rating!,
                ),
              ),

            // ── Description ────────────────────────────────────────────────
            Positioned(
              bottom: 0,
              left: 0,
              child: DescriptionContainer(
                constraints: constraints,
                carModel: carModel,
              ),
            ),

            // ── See Details ────────────────────────────────────────────────
            Positioned(
              right: 0,
              bottom: 15,
              child: SeeDetailsContainer(
                constraints: constraints,
                onTap: () {
                  controller.moveToCarDetails(carModel);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Fallback when no image is available ───────────────────────────────────────

class _PlaceholderImage extends StatelessWidget {
  final BoxConstraints constraints;
  const _PlaceholderImage({required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.25,
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade900,
      ),
      child: const Center(
        child: Icon(
          Icons.directions_car_outlined,
          color: Colors.white38,
          size: 60,
        ),
      ),
    );
  }
}