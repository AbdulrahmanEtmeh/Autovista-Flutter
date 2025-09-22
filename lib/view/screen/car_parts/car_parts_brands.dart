import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/my_drawer_controller.dart';
import 'package:graduation_project/core/function/custom_app_bar.dart';
import 'package:graduation_project/view/widget/auth/title_text.dart';

import '../../../controller/car_parts/car_parts_brands_controller.dart';
import '../../widget/car_parts/part_brand_item.dart';
import '../../widget/shared/main_button.dart';

class CarPartsBrands extends StatelessWidget {
  const CarPartsBrands({super.key});

  @override
  Widget build(BuildContext context) {
    CarPartsBrandsControllerImp controller =
        Get.put(CarPartsBrandsControllerImp());
    MyDrawerController drawerController = Get.put(MyDrawerController());
    return Scaffold(
      appBar: drawerAppBar(
        context,
        title: 'Car Parts'.tr,
        onPressed: () {
          drawerController.drawerKey.currentState!.openDrawer();
        },
      ),
      body: Padding(
        padding: EdgeInsets.only(
          right: Get.width * 0.05,
          left: Get.width * 0.05,
          bottom: Get.height * 0.05,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.05),
              TitleText(text: 'Choose Brand'.tr),
              GetBuilder<CarPartsBrandsControllerImp>(
                builder: (controller) => Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Get.height * 0.035,
                      horizontal: Get.width * 0.04),
                  child: SizedBox(
                    height: Get.height * 0.5,
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: Get.width * 0.05,
                        mainAxisSpacing: Get.height * 0.025,
                        mainAxisExtent: Get.height * 0.125,
                      ),
                      itemCount: controller.carBrands.length,
                      itemBuilder: (context, index) {
                        return PartBrandItem(
                          carBrandsModel: controller.carBrands[index],
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
                    onPressed: () {
                      controller
                          .moveToCarPartsCategories(controller.selectedIndex);
                    },
                    height: Get.height * 0.065,
                    width: Get.width),
              )
            ],
          ),
        ),
      ),
    );
  }
}
