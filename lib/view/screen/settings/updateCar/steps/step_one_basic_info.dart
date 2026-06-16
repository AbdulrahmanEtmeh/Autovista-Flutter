import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/controller/settings/update_car_controller.dart';
import 'package:graduation_project/view/widget/search/filter/custom_drop_down_field.dart';
import 'package:graduation_project/view/widget/shared/custom_text_field.dart';
import 'package:graduation_project/view/widget/shared/field_title.dart';
import 'package:graduation_project/view/widget/update_car_widget/error_text.dart';


class StepOneBasicInfo extends StatelessWidget {
  final UpdateCarControllerImp controller;
  const StepOneBasicInfo({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  Name 
        const FieldTitle(text: 'Name (English)'),
        CustomTextField(
          fieldController: controller.nameEnController,
          hintText: 'e.g. Toyota Camry',
        ),
        ErrorText(errors: controller.errors, fieldKey: 'nameEn'),

        const FieldTitle(text: 'Name (Arabic)'),
        CustomTextField(
          fieldController: controller.nameArController,
          hintText: 'e.g. تويوتا كامري',
        ),
        ErrorText(errors: controller.errors, fieldKey: 'nameAr'),

        //  Price 
        const FieldTitle(text: 'Price'),
        CustomTextField(
          fieldController: controller.priceController,
          hintText: 'Price in \$',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        ErrorText(errors: controller.errors, fieldKey: 'price'),

        //  Brand 
        const FieldTitle(text: 'Brand'),
        CustomDropDownField(
          value: controller.selectedBrand,
          onChanged: (val) => controller.changeBrand(val),
          items: controller.brands
              .map((b) => DropdownMenuItem<Object>(value: b, child: Text(b.name ?? '')))
              .toList(),
        ),
        ErrorText(errors: controller.errors, fieldKey: 'brand'),

        //  Style 
        const FieldTitle(text: 'Style'),
        CustomDropDownField(
          value: controller.selectedStyle,
          onChanged: (val) => controller.changeStyle(val),
          items: controller.styles
              .map((s) => DropdownMenuItem<Object>(value: s, child: Text(s.name ?? '')))
              .toList(),
        ),
        ErrorText(errors: controller.errors, fieldKey: 'style'),

        //  Year 
        const FieldTitle(text: 'Year'),
        CustomTextField(
          fieldController: controller.yearController,
          hintText: 'e.g. 2024',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        ErrorText(errors: controller.errors, fieldKey: 'year'),
      ],
    );
  }
}