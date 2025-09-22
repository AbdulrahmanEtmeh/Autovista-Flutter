import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/view/widget/shared/part_product_item/content_container.dart';

import '../../../../data/model/car_parts_items_model.dart';
import '../../../controller/cart/my_cart_controller.dart';
import '../shared/part_product_item/part_button.dart';

class CartItem extends StatelessWidget {
  final CarPartsItemsModel carPartsItemsModel;
  const CartItem({
    super.key,
    required this.carPartsItemsModel,
  });

  @override
  Widget build(BuildContext context) {
    MyCartController controller = Get.find();
    return Stack(
      children: [
        ContentContainer(carPartsItemsModel: carPartsItemsModel),
        Positioned(
          bottom: 0,
          right: 0,
          child: PartButton(
            onPressed: () {
              controller.removeCart(carPartsItemsModel.id!);
            },
            icon: Icons.delete_outlined,
          ),
        )
      ],
    );
  }
}
