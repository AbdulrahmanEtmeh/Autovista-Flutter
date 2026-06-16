import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/settings/add_car_controller.dart';
import 'package:graduation_project/view/widget/add_cars/image_picker_section.dart';
import 'package:graduation_project/view/widget/add_cars/rent_toggle.dart';
import 'package:graduation_project/view/widget/shared/custom_text_field.dart';
import 'package:graduation_project/view/widget/shared/field_title.dart';
import 'package:graduation_project/view/widget/update_car_widget/error_text.dart';


class StepThreeAppearance extends StatelessWidget {
  final AddCarControllerImp controller;
  const StepThreeAppearance({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  MPG 
        const FieldTitle(text: 'Highway MPG'),
        CustomTextField(
          fieldController: controller.highwayMpgController,
          hintText: 'e.g. 35',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        ErrorText(errors: controller.errors, fieldKey: 'highwayMpg'),

        const FieldTitle(text: 'City MPG'),
        CustomTextField(
          fieldController: controller.cityMpgController,
          hintText: 'e.g. 28',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        ErrorText(errors: controller.errors, fieldKey: 'cityMpg'),

        //  Color 
        const FieldTitle(text: 'Color (English)'),
        CustomTextField(
          fieldController: controller.colorEnController,
          hintText: 'e.g. Red',
        ),
        ErrorText(errors: controller.errors, fieldKey: 'colorEn'),

        const FieldTitle(text: 'Color (Arabic)'),
        CustomTextField(
          fieldController: controller.colorArController,
          hintText: 'e.g. أحمر',
        ),
        ErrorText(errors: controller.errors, fieldKey: 'colorAr'),

        //  Market Category 
        const FieldTitle(text: 'Market Category (English)'),
        CustomTextField(
          fieldController: controller.marketCategoryEnController,
          hintText: 'e.g. Sedan',
        ),
        ErrorText(errors: controller.errors, fieldKey: 'marketEn'),

        const FieldTitle(text: 'Market Category (Arabic)'),
        CustomTextField(
          fieldController: controller.marketCategoryArController,
          hintText: 'e.g. سيدان',
        ),
        ErrorText(errors: controller.errors, fieldKey: 'marketAr'),

        //  Sale - Rent 
        const FieldTitle(text: 'For Sale or Rent?'),
        RentToggle(controller: controller),

        //  Images 
        const FieldTitle(text: 'Car Images'),
        ImagePickerSection(controller: controller),
        ErrorText(errors: controller.errors, fieldKey: 'images'),

        SizedBox(height: Get.height * 0.02),
      ],
    );
  }
}