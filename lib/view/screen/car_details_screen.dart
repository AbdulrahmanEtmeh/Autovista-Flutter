import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/class/handling_data_view.dart';
import 'package:graduation_project/view/widget/carDetails/carDetailsInfoContainer/car_details_info_card.dart';

import '../../controller/car_datails_controller.dart';
import '../../controller/favorite/favorite_controller.dart';
import '../widget/carDetails/carDetailsPageView/car_datails_page_view.dart';
import '../widget/carDetails/carDetailsPageView/car_details_page_indicator.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CarDatailsControllerImp());
    Get.put(FavoriteController());
    return GetBuilder<CarDatailsControllerImp>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: const SingleChildScrollView(
              child: Stack(
                children: [
                  CarDetailsPageView(),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: 375),
                        child: CarDetailsPageIndicator(),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 390), //
                    child: CarDetailsInfoCard(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
