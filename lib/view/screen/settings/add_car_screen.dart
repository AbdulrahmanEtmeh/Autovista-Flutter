import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/settings/add_car_controller.dart';
import 'package:graduation_project/core/class/enums/car_capacity.dart';
import 'package:graduation_project/core/class/enums/car_cylinders.dart';
import 'package:graduation_project/core/class/enums/fuel_type.dart';
import 'package:graduation_project/core/function/custom_app_bar.dart';

import '../../../controller/home/home_page_controller.dart';
import '../../../core/class/enums/transmission_type.dart';
import '../../../data/model/car_brands_model.dart';
import '../../../data/model/car_categories_model.dart';
import '../../widget/search/filter/custom_drop_down_field.dart';
import '../../widget/shared/custom_text_field.dart';
import '../../widget/shared/field_title.dart';

class AddCarScreen extends StatelessWidget {
  const AddCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddCarControllerImp controller = Get.put(AddCarControllerImp());
    HomePageControllerImp homeController = Get.put(HomePageControllerImp());
    return Scaffold(
      appBar: customAppBar(context, title: 'Sale Your Car'),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.025, horizontal: Get.width * 0.035),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldTitle(text: 'Name'.tr),
              CustomTextField(
                fieldController: controller.namecontroller,
                hintText: 'car name ...',
              ),
              const FieldTitle(text: 'Price'),
              CustomTextField(
                fieldController: controller.priceController,
                hintText: 'Price in \$',
              ),
              const FieldTitle(text: 'Brand'),
              CustomDropDownField(
                onChanged: (val) {
                  controller.changeBrand(val);
                },
                value: controller.selectedBrand,
                items: Brands.values.map((b) {
                  return DropdownMenuItem(
                    value: b,
                    child: Text(
                      b.title,
                    ),
                  );
                }).toList(),
              ),
              const FieldTitle(text: 'Style'),
              CustomDropDownField(
                onChanged: (val) {
                  controller.changeVehicleStyle(val);
                },
                value: controller.selectedVehicleStyle,
                items: VehicleStyle.values.map((s) {
                  return DropdownMenuItem(
                    value: s,
                    child: Text(
                      s.title,
                    ),
                  );
                }).toList(),
              ),
              const FieldTitle(text: 'Capacity'),
              CustomDropDownField(
                onChanged: (val) {
                  // controller.changeBrand(val);
                  controller.changeCarCapacity(val);
                },
                value: controller.selectedCarCapacity,
                items: CarCapacity.values.map((c) {
                  return DropdownMenuItem(
                    value: c,
                    child: Text(
                      '${c.passengers} Passengers',
                    ),
                  );
                }).toList(),
              ),
              const FieldTitle(text: 'Gear Shift'),
              CustomDropDownField(
                onChanged: (val) {
                  controller.changeTransmissionType(val);
                },
                value: controller.selectedTransmissionType,
                items: TransmissionType.values.map((t) {
                  return DropdownMenuItem(
                    value: t,
                    child: Text(
                      t.title,
                    ),
                  );
                }).toList(),
              ),
              const FieldTitle(text: 'FuelType'),
              CustomDropDownField(
                onChanged: (val) {
                  controller.changeFuelType(val);
                },
                value: controller.selectedFuelType,
                items: FuelType.values.map((f) {
                  return DropdownMenuItem(
                    value: f,
                    child: Text(f.title),
                  );
                }).toList(),
              ),
              const FieldTitle(text: 'Engine Horse Power'),
              CustomTextField(
                fieldController: controller.engineHpcontroller,
                hintText: 'Engine CC',
              ),
              const FieldTitle(text: 'Cylinders'),
              CustomDropDownField(
                onChanged: (val) {
                  controller.changeCylinders(val);
                },
                value: controller.selectedCylindre,
                items: CarCylinders.values.map((c) {
                  return DropdownMenuItem(
                    value: c,
                    child: Text('${c.cylinder}'),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
