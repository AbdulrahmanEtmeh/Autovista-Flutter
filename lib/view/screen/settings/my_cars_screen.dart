import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/settings/my_cars_controller.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/core/function/custom_app_bar.dart';
import 'package:graduation_project/view/widget/mycar/my_car_card%20.dart';

class MyCarsScreen extends StatelessWidget {
  const MyCarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addCarAppBar(
        context,
        title: 'My Cars',
        onPressed: () {
          Get.toNamed(AppRoutes.addCar);
        },
      ),
      body: GetBuilder<MyCarsController>(
        init: MyCarsController(),
        builder: (controller) {
          // ── Loading ──────────────────────────────────────────────────────
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.red),
            );
          }

          //  Empty 
          if (controller.myCars.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.directions_car_outlined,
                    color: Colors.white38,
                    size: 70,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No cars yet',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white54,
                        ),
                  ),
                ],
              ),
            );
          }

          //  List 
          return ListView.builder(
            padding: const EdgeInsets.only(top: 8, bottom: 24),
            itemCount: controller.myCars.length,
            itemBuilder: (context, index) {
              final car = controller.myCars[index];
              return MyCarCard(
                car: car,
                onEdit: () async {
  final result = await Get.toNamed(
    AppRoutes.updateCar,
    arguments: {'car': car},
  );
  if (result == true) {
    controller.getMyCars();
  }
},
                onDelete: () => controller.deleteCar(car.id!),
              );
            },
          );
        },
      ),
    );
  }
}