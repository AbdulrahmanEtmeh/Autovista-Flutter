import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/view/widget/home/reco_grid/components/gear_and_size.dart';
import 'package:graduation_project/view/widget/home/reco_grid/components/image_stack.dart';
import 'package:graduation_project/view/widget/home/reco_grid/components/price_and_year.dart';

import '../../../../../controller/home/home_page_controller.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../data/model/car_model.dart';
import 'see_details_reco_container.dart';

class RecoGridItem extends GetView<HomePageControllerImp> {
  final CarModel carModel;
  const RecoGridItem({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        decoration: BoxDecoration(
          color: AppColors.homeContainers,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.primaryRed.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(constraints.maxHeight * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageStack(
                    constraints: constraints,
                    carModel: carModel,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.025),
                  SizedBox(
                    width: constraints.maxWidth * 0.7,
                    height: constraints.maxHeight * 0.12,
                    child: Text(
                      carModel.name!,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.primaryWhite),
                    ),
                  ),
                  PriceAndYear(
                      constraints: constraints, price: carModel.price!),
                  SizedBox(height: constraints.maxHeight * 0.01),
                  GearAndSize(
                      constraints: constraints,
                      gearType: carModel.gearType!,
                      nmuOfPeople: carModel.capacity!),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SeeDetailsRecoContainer(
                onTap: () {
                  controller.moveToCarDetails(carModel);
                },
                constraints: constraints,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
