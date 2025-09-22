import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/class/handling_data_view.dart';

import '../../../controller/favorite/favorite_controller.dart';
import '../../../controller/home/home_page_controller.dart';
import '../../widget/home/reco_grid/reco_grid.dart';
import '../../widget/shared/section_name.dart';
import '../../widget/home/home_page/brands_list.dart';
import '../../widget/home/home_page/today_list.dart';
import '../../widget/home/home_page/categories_list.dart';
import '../../widget/home/home_page/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    Get.put(FavoriteController());
    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HomeAppBar(),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget:
                    // SearchList(
                    //       listCarsModel: controller.listCars,
                    //     )
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.03,
                          vertical: Get.height * 0.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionName(text: 'Today\'s Special'.tr),
                          const TodayList(),
                          SectionName(text: 'Categories'.tr),
                          const CategoriesList(),
                          SectionName(text: 'Recommended For You'.tr),
                          const RecoGrid(),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.05),
                    const BrandsList(),
                    SizedBox(height: Get.height * 0.1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
