import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/view/widget/search/filter/filter_product_interface.dart';

import '../../../controller/search/filter_result_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/function/custom_app_bar.dart';

class FilterResultsScreen extends StatelessWidget {
  const FilterResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FilterResultController());
    return Scaffold(
      appBar: customAppBar(context, title: 'Filter'.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.03, vertical: Get.height * 0.01),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GetBuilder<FilterResultController>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: controller.cars.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: Get.height * 0.025),
                        itemBuilder: (context, index) {
                          return FilterProductInterface(
                            carModel: controller.cars[index],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
