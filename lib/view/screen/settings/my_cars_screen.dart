import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/core/function/custom_app_bar.dart';

class MyCarsScreen extends StatelessWidget {
  const MyCarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addCarAppBar(
        context,
        title: 'MyCars',
        onPressed: () {
          Get.toNamed(AppRoutes.addCar);
        },
      ),
      body: Center(
        child: Text('This is MyCars Screen'),
      ),
    );
  }
}
