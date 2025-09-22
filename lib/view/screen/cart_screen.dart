import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/function/custom_app_bar.dart';
import 'package:graduation_project/view/widget/cart/order_summary.dart';
import 'package:graduation_project/view/widget/shared/main_button.dart';

import '../../controller/cart/my_cart_controller.dart';
import '../widget/cart/cart_item.dart';
import '../widget/cart/clear_cart_button.dart';
import '../widget/shared/custom_text_field.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyCartController controller = Get.put(MyCartController());
    return Scaffold(
      appBar: customAppBar(context, title: 'Cart'),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.04, vertical: Get.height * 0.01),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetBuilder<MyCartController>(
                    builder: (controller) => Text(
                      'Items (${controller.data.length})',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.primaryWhite),
                    ),
                  ),
                  ClearCartButton(onPressed: () {}),
                ],
              ),
              SizedBox(height: Get.height * 0.01),
              GetBuilder<MyCartController>(
                builder: (controller) => SizedBox(
                  height: Get.height * 0.35,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: controller.data.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: Get.height * 0.01,
                    ),
                    itemBuilder: (context, index) {
                      return CartItem(
                        carPartsItemsModel: controller.data[index],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.025),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 2,
                    child: CustomTextField(
                      hintText: 'Coupon Code ...',
                    ),
                  ),
                  SizedBox(width: Get.width * 0.05),
                  Expanded(
                    child: MainButton(
                      buttonText: 'Coupn',
                      onPressed: () {},
                      height: Get.height * 0.065,
                      width: Get.width,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.025),
              const OrderSummary(),
              SizedBox(height: Get.height * 0.01),
              MainButton(
                  buttonText: 'Buy Now',
                  onPressed: () {
                    controller.moveToPayment();
                    controller.moveToPayment();
                  },
                  height: Get.height * 0.065,
                  width: Get.width),
            ],
          ),
        ),
      ),
    );
  }
}
