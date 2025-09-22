import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/function/custom_app_bar.dart';
import 'package:graduation_project/view/widget/cart/order_summary.dart';
import 'package:graduation_project/view/widget/shared/main_button.dart';
import 'package:graduation_project/view/widget/shared/section_name.dart';

import '../../controller/payment_controller.dart';
import '../widget/payment/payment_method_container.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentController());
    return Scaffold(
      appBar: customAppBar(context, title: 'Payment'),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.01, horizontal: Get.width * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionName(text: 'Payment Methods'),
              const PaymentMethodContainer(
                icon: Icons.credit_card_outlined,
                methodName: 'Credit/Debit Card',
              ),
              const PaymentMethodContainer(
                  icon: Icons.paypal_outlined, methodName: 'PayPal'),
              const PaymentMethodContainer(
                  icon: Icons.apple_outlined, methodName: "Apple Pay"),
              const SectionName(text: 'Order Summary'),
              const OrderSummary(),
              SizedBox(height: Get.height * 0.01),
              MainButton(
                  buttonText: 'Choose Method',
                  onPressed: () {},
                  height: Get.height * 0.065,
                  width: Get.width),
            ],
          ),
        ),
      ),
    );
  }
}
