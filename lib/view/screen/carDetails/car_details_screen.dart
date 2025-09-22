import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/view/widget/shared/section_name.dart';

import '../../../controller/carDetails/car_datails_controller.dart';
import '../../../controller/favorite/favorite_controller.dart';
import '../../widget/carDetails/car_datails_page_view.dart';
import '../../widget/carDetails/car_details_info_container.dart';
import '../../widget/carDetails/car_details_list_view.dart';
import '../../widget/carDetails/car_details_page_indicator.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CarDatailsControllerImp());
    Get.put(FavoriteController());
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: CarDetailsPageView(),
          ),
          CarDetailsPageIndicator(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: SectionName(text: 'Specefications'),
          ),
          CarDetailsListView(),
          SizedBox(height: 20),
          CarDetailsInfoContainer(),
        ],
      ),
    );
  }
}
