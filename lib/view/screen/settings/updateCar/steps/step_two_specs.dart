import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/controller/settings/update_car_controller.dart';
import 'package:graduation_project/core/class/enums/car_capacity.dart';
import 'package:graduation_project/core/class/enums/car_cylinders.dart';
import 'package:graduation_project/core/class/enums/fuel_type.dart';
import 'package:graduation_project/core/class/enums/transmission_type.dart';
import 'package:graduation_project/view/widget/search/filter/custom_drop_down_field.dart';
import 'package:graduation_project/view/widget/shared/custom_text_field.dart';
import 'package:graduation_project/view/widget/shared/field_title.dart';
import 'package:graduation_project/view/widget/update_car_widget/error_text.dart';


class StepTwoSpecs extends StatelessWidget {
  final UpdateCarControllerImp controller;
  const StepTwoSpecs({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  Capacity 
        const FieldTitle(text: 'Capacity'),
        CustomDropDownField(
          value: controller.selectedCarCapacity,
          onChanged: (val) => controller.changeCarCapacity(val),
          items: CarCapacity.values
              .map((c) => DropdownMenuItem<Object>(value: c, child: Text('${c.passengers} Passengers')))
              .toList(),
        ),
        ErrorText(errors: controller.errors, fieldKey: 'capacity'),

        //  Transmission 
        const FieldTitle(text: 'Gear Shift'),
        CustomDropDownField(
          value: controller.selectedTransmissionType,
          onChanged: (val) => controller.changeTransmissionType(val),
          items: TransmissionType.values
              .map((t) => DropdownMenuItem<Object>(value: t, child: Text(t.title)))
              .toList(),
        ),
        ErrorText(errors: controller.errors, fieldKey: 'transmission'),

        //  Fuel 
        const FieldTitle(text: 'Fuel Type'),
        CustomDropDownField(
          value: controller.selectedFuelType,
          onChanged: (val) => controller.changeFuelType(val),
          items: FuelType.values
              .map((f) => DropdownMenuItem<Object>(value: f, child: Text(f.title)))
              .toList(),
        ),
        ErrorText(errors: controller.errors, fieldKey: 'fuel'),

        //  Top Speed 
        const FieldTitle(text: 'Top Speed (km/h)'),
        CustomTextField(
          fieldController: controller.topSpeedController,
          hintText: 'e.g. 220',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        ErrorText(errors: controller.errors, fieldKey: 'topSpeed'),

        //  Engine HP 
        const FieldTitle(text: 'Engine Horse Power'),
        CustomTextField(
          fieldController: controller.engineHpController,
          hintText: 'e.g. 200',
            keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        ErrorText(errors: controller.errors, fieldKey: 'engineHp'),

        //  Cylinders 
        const FieldTitle(text: 'Cylinders'),
        CustomDropDownField(
          value: controller.selectedCylinder,
          onChanged: (val) => controller.changeCylinder(val),
          items: CarCylinders.values
              .map((c) => DropdownMenuItem<Object>(value: c, child: Text('${c.cylinder}')))
              .toList(),
        ),
        ErrorText(errors: controller.errors, fieldKey: 'cylinder'),
      ],
    );
  }
}