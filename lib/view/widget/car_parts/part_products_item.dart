import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/view/widget/shared/part_product_item/content_container.dart';

import '../../../controller/cart/cart_controller.dart';
import '../../../data/model/car_parts_items_model.dart';
import '../shared/part_product_item/part_button.dart';

class PartProductItem extends StatelessWidget {
  final CarPartsItemsModel carPartsItemsModel;
  final IconData cartIcon;
  const PartProductItem(
      {super.key, required this.carPartsItemsModel, required this.cartIcon});

  @override
  Widget build(BuildContext context) {
    CartController controllerCart = Get.find();
    return Stack(
      children: [
        ContentContainer(carPartsItemsModel: carPartsItemsModel),
        Positioned(
          bottom: 0,
          right: 0,
          child: PartButton(
            onPressed: () {
              controllerCart.addCart(carPartsItemsModel.id!);
            },
            icon: cartIcon,
          ),
        ),
      ],
    );
  }
}
