import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';

class PaymentMethodContainer extends StatelessWidget {
  final IconData icon;
  final String methodName;
  const PaymentMethodContainer({
    super.key,
    required this.icon,
    required this.methodName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Get.height * 0.015),
      child: SizedBox(
        height: Get.height * 0.115,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.homeContainers,
            borderRadius: BorderRadius.circular(15),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) => Row(
              children: [
                SizedBox(width: constraints.maxWidth * 0.1),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.drawerBackGround,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: constraints.maxHeight * 0.65,
                  width: constraints.maxWidth * 0.18,
                  child: Icon(
                    icon,
                    color: AppColors.redBlur,
                    size: constraints.maxHeight * 0.4,
                  ),
                ),
                SizedBox(width: constraints.maxWidth * 0.05),
                Text(
                  methodName,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.primaryWhite),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
