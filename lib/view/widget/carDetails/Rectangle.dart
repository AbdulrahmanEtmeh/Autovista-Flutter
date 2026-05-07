// Spec Card Widget (Gear type / Cylinders)
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_colors.dart';

class Rectangle extends StatelessWidget {
  final String label;
  final String value;

  const Rectangle({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.425,
      height: Get.height * 0.1,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF182229),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF182229)),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF263036),
            Color(0xFF070C0F),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.primaryRed,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: Get.height * 0.0075),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
