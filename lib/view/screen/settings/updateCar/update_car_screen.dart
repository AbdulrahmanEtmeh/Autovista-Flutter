import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/settings/update_car_controller.dart';
import 'package:graduation_project/core/function/custom_app_bar.dart';
import 'package:graduation_project/view/widget/update_car_widget/step_indicator.dart';
import 'package:graduation_project/view/widget/update_car_widget/step_nav_buttons.dart';
import 'steps/step_one_basic_info.dart';
import 'steps/step_two_specs.dart';
import 'steps/step_three_appearance.dart';



class UpdateCarScreen extends StatelessWidget {
  const UpdateCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateCarControllerImp());

    return GetBuilder<UpdateCarControllerImp>(
      builder: (_) => Scaffold(
        appBar: customAppBar(
          context,
          title: 'Edit Car (Step ${controller.currentStep + 1}/3)',
        ),
        body: Column(
          children: [
            // ── Progress bar ──────────────────────────────────────────────
            StepIndicator(currentStep: controller.currentStep),

            // ── Active step content ───────────────────────────────────────
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

            // ── Back / Next / Submit — pinned at bottom ───────────────────
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