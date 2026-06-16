import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/settings/update_car_controller.dart';

class RentToggle extends StatelessWidget {
  final UpdateCarControllerImp controller;
  const RentToggle({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _RadioOption(
          label: 'Sale',
          selected: !controller.isRent,
          onTap: () => controller.changeRentStatus(false),
        ),
        SizedBox(width: Get.width * 0.06),
        _RadioOption(
          label: 'Rent',
          selected: controller.isRent,
          onTap: () => controller.changeRentStatus(true),
        ),
      ],
    );
  }
}

class _RadioOption extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _RadioOption({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Radio<bool>(
            value: true,
            groupValue: selected,
            onChanged: (_) => onTap(),
            activeColor: Colors.red,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}