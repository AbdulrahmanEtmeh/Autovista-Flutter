import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/search/filter_controller.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/view/widget/shared/custom_text_field.dart';
import 'package:graduation_project/view/widget/shared/field_title.dart';

import '../../../core/class/enums/transmission_type.dart';
import '../../../data/model/car_brands_model.dart';
import '../../../data/model/car_categories_model.dart';
import '../../widget/search/filter/filter_button.dart';
import '../../widget/search/filter/filter_check_box.dart';
import '../../widget/search/filter/filter_radio_list.dart';
import '../../widget/search/filter/custom_drop_down_field.dart';
import '../../widget/search/filter/buy_rent_column.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FilterController controller = Get.put(FilterController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.075, horizontal: Get.width * 0.035),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<FilterController>(
                builder: (controller) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BuyRentColumn(
                      onTap: () {
                        controller.chooseBuy();
                      },
                      color: controller.buyColor,
                      title: 'Buy'.tr,
                      icon: Icons.local_taxi,
                    ),
                    SizedBox(width: Get.width * 0.1),
                    BuyRentColumn(
                      onTap: () {
                        controller.chooseRent();
                      },
                      color: controller.rentColor,
                      title: 'Rent'.tr,
                      icon: Icons.key,
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.025),
              FieldTitle(text: 'Car Brand'.tr),
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
              FieldTitle(text: 'Car Name'.tr),
              CustomTextField(
                fieldController: controller.carName,
                hintText: 'car name ...',
              ),
              FieldTitle(text: 'Transmission Type'.tr),
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
              FieldTitle(text: 'Vehicle Style'.tr),
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
              FieldTitle(text: 'Capacity'.tr),
              FilterRadioList(
                title: '2 ${'Passengers'.tr}',
                value: 2,
              ),
              FilterRadioList(
                title: '4 ${'Passengers'.tr}',
                value: 4,
              ),
              FilterRadioList(
                title: '6 ${'or more Passengerrs'.tr}',
                value: 6,
              ),
              FieldTitle(text: 'Cylinders'.tr),
              GetBuilder<FilterController>(
                builder: (controller) => Column(
                  children: [
                    FilterCheckBox(
                      value: controller.cylinderFour,
                      onChanged: (value) {
                        if (value == true) {
                          controller.addCylinderValue("4");
                        } else {
                          controller.removeCylinderValue("4");
                        }
                        controller.cylinderFour = value!;
                        controller.update();
                      },
                      title: '4',
                      cylinderValue: "4",
                    ),
                    FilterCheckBox(
                      value: controller.cylinderSix,
                      onChanged: (value) {
                        if (value == true) {
                          controller.addCylinderValue("6");
                        } else {
                          controller.removeCylinderValue("6");
                        }
                        controller.cylinderSix = value!;
                        controller.update();
                      },
                      title: '6',
                      cylinderValue: "6",
                    ),
                    FilterCheckBox(
                      value: controller.cylinderEight,
                      onChanged: (value) {
                        if (value == true) {
                          controller.addCylinderValue("8");
                        } else {
                          controller.removeCylinderValue("8");
                        }
                        controller.cylinderEight = value!;
                        controller.update();
                      },
                      title: '8',
                      cylinderValue: "8",
                    ),
                    FilterCheckBox(
                      value: controller.cylinderTwelve,
                      onChanged: (value) {
                        if (value == true) {
                          controller.addCylinderValue("12");
                        } else {
                          controller.removeCylinderValue("12");
                        }
                        controller.cylinderTwelve = value!;
                        controller.update();
                      },
                      title: '12',
                      cylinderValue: "12",
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.025),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilterButton(
                    color: AppColors.homeContainers,
                    text: 'Reset'.tr,
                    onPressed: () {
                      controller.resetFields();
                    },
                  ),
                  FilterButton(
                    color: AppColors.primaryRed,
                    text: 'Search'.tr,
                    onPressed: () {
                      controller.filterSearch();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
