import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/data/model/car_model.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../favorite_icon_container.dart';

class NameContainer extends StatelessWidget {
  final BoxConstraints constraints;
  final CarModel carModel;
  const NameContainer(
      {super.key, required this.constraints, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight * 0.3,
      width: Get.width * 0.5,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: AppColors.pureBlack.withOpacity(0.6),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomRight: Radius.circular(35),
            )),
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: Get.width * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FavoriteIconContainer(
                carModel: carModel,
                iconSize: constraints.maxHeight * 0.1,
                containerSize: constraints.minHeight * 0.175,
              ),
              SizedBox(width: Get.width * 0.025),
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.01),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      carModel.name!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.primaryWhite),
                    ),
                    Text(
                      '\$ ${carModel.price}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.primaryWhite),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
