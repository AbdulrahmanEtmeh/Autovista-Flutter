import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart/my_cart_controller.dart';
import '../../../core/constant/app_colors.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  Widget cartText(BuildContext context,
      {required String text, required Color color}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(color: color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCartController>(
      builder: (controller) => Column(
        children: [
          const Divider(
            color: AppColors.primaryRed,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cartText(context,
                      text: 'Price', color: AppColors.primaryWhite),
                  cartText(context,
                      text: 'Discount', color: AppColors.primaryWhite),
                  cartText(context,
                      text: 'VAT (%15)', color: AppColors.primaryWhite),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  cartText(context,
                      text: '\$ ${controller.price.toStringAsFixed(2)}',
                      color: AppColors.primaryWhite),
                  cartText(context, text: '%0', color: AppColors.primaryWhite),
                  cartText(context,
                      text: '\$ ${controller.vat.toStringAsFixed(2)}',
                      color: AppColors.primaryWhite),
                ],
              ),
            ],
          ),
          const Divider(
            color: AppColors.primaryRed,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cartText(context,
                  text: 'Total Price', color: AppColors.primaryRed),
              cartText(context,
                  text: '\$ ${controller.totalPrice.toStringAsFixed(2)}',
                  color: AppColors.primaryRed),
            ],
          ),
        ],
      ),
    );
  }
}
