import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/class/enums/driven_wheels.dart';
import 'package:graduation_project/core/class/enums/fuel_type.dart';
import 'package:graduation_project/core/class/enums/market_category.dart';
import 'package:graduation_project/core/class/enums/number_of_doors.dart';
import 'package:graduation_project/core/class/enums/transmission_type.dart';
import 'package:graduation_project/core/class/enums/vehicle_size.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_text_styles.dart';
import 'package:graduation_project/core/function/custom_app_bar.dart';
import 'package:graduation_project/view/widget/shared/section_name.dart';

import '../../../controller/pricePrediction/price_prediction_controller.dart';
import '../../../data/model/car_brands_model.dart';
import '../../../data/model/car_categories_model.dart';
import '../../widget/search/filter/custom_drop_down_field.dart';

class PricePredictionScreen extends StatelessWidget {
  const PricePredictionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PricePredictionController controller = Get.put(PricePredictionController());
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: customAppBar(context, title: 'Price Prediction'),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: ListView(children: [
          const Text(
            'Please provide the following features of the car for which you would like to know the price:',
            style: AppTextStyles.pricePredictionHeader,
          ),
          const SizedBox(height: 20),
          // const PricePredictionFieldTitle(title: 'Car Brand'),
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
          // const PricePredictionFieldTitle(title: 'Car Name'),
          // PricePredictionTextField(
          //   fieldController: controller.carName,
          //   hintText: 'car name ...',
          // ),
          // // const PricePredictionFieldTitle(title: 'Make Year'),
          // PricePredictionTextField(
          //   fieldController: controller.makeYear,
          //   hintText: 'year ...',
          //   keyboardType: TextInputType.number,
          // ),
          // const PricePredictionFieldTitle(title: 'Fuel Type'),
          CustomDropDownField(
            onChanged: (val) {
              controller.changeFuelType(val);
            },
            value: controller.selectedFuelType,
            items: FuelType.values.map((f) {
              return DropdownMenuItem(
                value: f,
                child: Text(
                  f.title,
                ),
              );
            }).toList(),
          ),
          // const PricePredictionFieldTitle(title: 'Engin Hp'),
          // PricePredictionTextField(
          //   fieldController: controller.engineHp,
          //   hintText: 'engine hp ...',
          //   keyboardType: TextInputType.number,
          // ),
          // // const PricePredictionFieldTitle(title: 'Engin Cylinders'),
          // PricePredictionTextField(
          //   fieldController: controller.engineCylinder,
          //   hintText: 'engine cylinders ...',
          //   keyboardType: TextInputType.number,
          // ),
          // const PricePredictionFieldTitle(title: 'Transmission Type'),
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
          // const PricePredictionFieldTitle(title: 'Driven Wheels'),
          CustomDropDownField(
            onChanged: (val) {
              controller.changeDrivenWheels(val);
            },
            value: controller.selectedDrivenWheels,
            items: DrivenWheels.values.map((w) {
              return DropdownMenuItem(
                value: w,
                child: Text(
                  w.title,
                ),
              );
            }).toList(),
          ),
          // const PricePredictionFieldTitle(title: 'Number of Doors'),
          CustomDropDownField(
            onChanged: (val) {
              controller.changeNumberOfDoors(val);
            },
            value: controller.selectedDoors,
            items: NumberOfDoors.values.map((d) {
              return DropdownMenuItem(
                value: d,
                child: Text(
                  d.name,
                ),
              );
            }).toList(),
          ),
          // const PricePredictionFieldTitle(title: 'Market Category'),
          CustomDropDownField(
            onChanged: (val) {
              controller.changeMarketCategoty(val);
            },
            value: controller.selectedMarketCategory,
            items: MarketCategory.values.map((m) {
              return DropdownMenuItem(
                value: m,
                // ignore: sized_box_for_whitespace
                child: Container(
                  width: 200, // Set a fixed width for the dropdown menu item
                  child: Text(
                    m.title,
                    overflow: TextOverflow
                        .ellipsis, // Add an ellipsis if the text is too long
                  ),
                ),
              );
            }).toList(),
          ),
          // const PricePredictionFieldTitle(title: 'Vehicle Size'),
          CustomDropDownField(
            onChanged: (val) {
              controller.changeVehicleSize(val);
            },
            value: controller.selectedVehicleSize,
            items: VehicleSize.values.map((s) {
              return DropdownMenuItem(
                value: s,
                child: Text(
                  s.title,
                ),
              );
            }).toList(),
          ),
          // const PricePredictionFieldTitle(title: 'Vehicle Style'),
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
          // const PricePredictionFieldTitle(title: 'Highway Mile Per Gallon'),
          // PricePredictionTextField(
          //   fieldController: controller.highwayMpg,
          //   hintText: 'highway mpg ...',
          //   keyboardType: TextInputType.number,
          // ),
          // // const PricePredictionFieldTitle(title: 'City Mile Per Gallon'),
          // PricePredictionTextField(
          //   fieldController: controller.cityMpg,
          //   hintText: 'city mpg ...',
          //   keyboardType: TextInputType.number,
          // ),
          // // const PricePredictionFieldTitle(title: 'Popularity'),
          // PricePredictionTextField(
          //   fieldController: controller.popularity,
          //   hintText: 'popularity ...',
          //   keyboardType: TextInputType.number,
          // ),
          const SizedBox(height: 25),
          // SuccessButton(
          //     buttonText: 'Predict Price',
          //     height: Get.height * 0.05,
          //     onPressed: () {
          //       controller.predictPrice();
          //     }),
          GetBuilder<PricePredictionController>(
            builder: (controller) => Row(
              children: [
                const SectionName(text: 'Predicted Price: '),
                const SizedBox(width: 10),
                Text(
                  ' \$ ${controller.predictedPrice}',
                  style: AppTextStyles.carDetailsPrice,
                )
              ],
            ),
          ),
          const SizedBox(height: 25),
        ]),
      ),
    );
  }
}
