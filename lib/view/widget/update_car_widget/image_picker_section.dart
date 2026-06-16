import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/settings/update_car_controller.dart';

class ImagePickerSection extends StatelessWidget {
  final UpdateCarControllerImp controller;
  const ImagePickerSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         
        if (controller.newImages.isNotEmpty)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.newImages.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) => Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(controller.newImages[index].path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                   
                    onTap: () => controller.removeNewImage(index),
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                      padding: const EdgeInsets.all(3),
                      child: const Icon(Icons.close, size: 14, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),

        SizedBox(height: Get.height * 0.015),

        //  Add images button 
        GestureDetector(
          onTap: controller.pickImages,
          child: Container(
            width: double.infinity,
            height: Get.height * 0.07,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.red.withOpacity(0.4), width: 1.5),
              color: Colors.red.withOpacity(0.05),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add_photo_alternate_outlined, color: Colors.red),
                SizedBox(width: Get.width * 0.02),
                Text(
                  controller.newImages.isEmpty ? 'Add Images' : 'Add More Images',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}