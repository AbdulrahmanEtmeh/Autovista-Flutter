// ── Private: grid of images already uploaded to the server 
import 'package:flutter/material.dart';
import 'package:graduation_project/controller/settings/update_car_controller.dart';
import 'package:graduation_project/core/constant/app_links.dart';

class ExistingImagesGrid extends StatelessWidget {
  final UpdateCarControllerImp controller;
  const ExistingImagesGrid({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.car.photos!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) => Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                '${AppLinks.imageRoot}/${controller.car.photos![index]}',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey.shade900,
                  child: const Icon(Icons.broken_image_outlined, color: Colors.white38),
                ),
              ),
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () => controller.removeExistingImage(index),
              child: Container(
                decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                padding: const EdgeInsets.all(4),
                child: const Icon(Icons.close, size: 14, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}