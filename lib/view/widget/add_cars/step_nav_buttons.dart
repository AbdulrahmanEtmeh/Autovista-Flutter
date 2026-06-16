import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/settings/add_car_controller.dart';

class StepNavButtons extends StatelessWidget {
  final AddCarControllerImp controller;
  const StepNavButtons({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //  Back button (hidden on step 1) 
        if (controller.currentStep > 0)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: OutlinedButton(
                onPressed: controller.goBack,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red),
                  padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  'Back',
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

        //  Next / Submit button 
        Expanded(
          child: ElevatedButton(
            onPressed: controller.isLoading ? null : controller.goNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              disabledBackgroundColor: Colors.red.withOpacity(0.6),
              padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: controller.isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                  )
                : Text(
                    controller.currentStep == 2 ? 'Submit Car' : 'Next Step',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ],
    );
  }
}