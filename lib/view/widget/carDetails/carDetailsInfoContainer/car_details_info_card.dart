import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/instance_manager.dart';
import 'package:graduation_project/controller/car_datails_controller.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_text_styles.dart';
import 'package:graduation_project/view/widget/carDetails/car_buy_button.dart';
import 'package:graduation_project/view/widget/carDetails/Rectangle.dart';
import 'package:graduation_project/view/widget/carDetails/seller_info_row.dart';

class CarDetailsInfoCard extends GetView<CarDatailsControllerImp> {
  const CarDetailsInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backGround,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Car Name
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Car Name',
                style: TextStyle(
                  color: AppColors.primaryWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${controller.carModel.name}\n',
                    style: const TextStyle(
                      color: AppColors.primaryWhite,
                      fontSize: 14,
                      fontWeight: FontWeight(500),
                    ),
                  ),
                 Text(
  "${controller.carModel.year?.toString().split('-').first??""}",
  style: const TextStyle(
    color: AppColors.primaryWhite,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
)
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Gear Type & Cylinders
          Row(
            children: [
              Expanded(
                child: Rectangle(
                    label: 'Gear type',
                    value: '${controller.carModel.gearType}'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Rectangle(
                    label: 'Cylinders',
                    value: '${controller.carModel.cylinders}'),
              ),
            ],
          ),

          const SizedBox(height: 15),

          // Seller Information
          const Text(
            'Seller Information',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),

          const Divider(color: AppColors.primaryRed, thickness: 1, height: 16),

          InfoRow(label: 'Name', value: '${controller.carModel.ownerName}'),
          InfoRow(label: 'Email', value: '${controller.carModel.ownerEmail}'),
          InfoRow(label: 'Phone', value: '${controller.carModel.ownerPhone}'),
          const Divider(color: AppColors.primaryRed, thickness: 1, height: 16),
          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Price",
                    style: AppTextStyles.carDetailsDescription,
                  ),
                  Text(
                    "\$ ${controller.carModel.price?.toStringAsFixed(0) ?? '0'}",
                    style: AppTextStyles.homePricePreTitle,
                  )
                ],
              ),
              SizedBox(
                width: Get.width * 0.6,
                height: 59,
                child: const BuyButton(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
