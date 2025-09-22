import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/car_parts/car_parts_categories_controller.dart';
import 'package:graduation_project/view/widget/auth/title_text.dart';
import 'package:graduation_project/view/widget/car_parts/part_category_item.dart';

import '../../../core/function/custom_app_bar.dart';
import '../../widget/shared/main_button.dart';

class CarPartsCategories extends StatelessWidget {
  const CarPartsCategories({super.key});

  @override
  Widget build(BuildContext context) {
    CarPartsCategoriesControllerImp controller =
        Get.put(CarPartsCategoriesControllerImp());
    return Scaffold(
      appBar: customAppBar(context, title: 'Car Parts'.tr),
      body: Padding(
        padding: EdgeInsets.only(
          right: Get.width * 0.05,
          left: Get.width * 0.05,
          bottom: Get.height * 0.01,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.05),
              TitleText(text: 'Choose Category'.tr),
              GetBuilder<CarPartsCategoriesControllerImp>(
                builder: (controller) => Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Get.height * 0.035,
                      horizontal: Get.width * 0.04),
                  child: SizedBox(
                    height: Get.height * 0.6,
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: Get.width * 0.05,
                        mainAxisExtent: Get.height * 0.19,
                      ),
                      itemCount: controller.carPartsCategories.length,
                      itemBuilder: (context, index) {
                        return PartCategoryItem(
                          carPartsCategoryModel:
                              controller.carPartsCategories[index],
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                child: MainButton(
                  buttonText: 'Continue'.tr,
                  height: Get.height * 0.065,
                  onPressed: () {
                    controller.moveToCarPartsItems(controller.selectedIndex);
                  },
                  width: Get.width,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
