import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/settings/add_car_controller.dart';

import 'package:graduation_project/core/function/custom_app_bar.dart';
import 'package:graduation_project/view/screen/settings/addCars/steps/Step_one_basic_info.dart';
import 'package:graduation_project/view/screen/settings/addCars/steps/step_three_appearance.dart';
import 'package:graduation_project/view/screen/settings/addCars/steps/step_two_specs.dart';
import 'package:graduation_project/view/widget/add_cars/step_nav_buttons.dart';

import 'package:graduation_project/view/widget/update_car_widget/step_indicator.dart';


class AddCarScreen extends StatelessWidget {
  const AddCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddCarControllerImp());

    return GetBuilder<AddCarControllerImp>(
      builder: (_) => Scaffold(
        appBar: customAppBar(
          context,
          title: 'Add New Car (Step ${controller.currentStep + 1}/3)',
        ),
        body: Column(
          children: [
             
            StepIndicator(currentStep: controller.currentStep),

            
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  vertical: Get.height * 0.025,
                  horizontal: Get.width * 0.035,
                ),
                child: [
                  StepOneBasicInfo(controller: controller),
                  StepTwoSpecs(controller: controller),
                  StepThreeAppearance(controller: controller),
                ][controller.currentStep],
              ),
            ),

            ///////////
            Padding(
              padding: EdgeInsets.fromLTRB(
                Get.width * 0.035,
                0,
                Get.width * 0.035,
                Get.height * 0.025,
              ),
              child: StepNavButtons(controller: controller),
            ),
          ],
        ),
      ),
    );
  }
}