// Spec Card Widget (Gear type / Cylinders)
import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';

class Rectangle extends StatelessWidget {
  final String label;
  final String value;

  const Rectangle({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
       width: 162,
  height: 81,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: const  Color(0xFF182229),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Color(0xFF182229)),
         gradient: LinearGradient(
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
          
            const SizedBox(height: 6),
            Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          
        ],
      ),
    );
  }
}
