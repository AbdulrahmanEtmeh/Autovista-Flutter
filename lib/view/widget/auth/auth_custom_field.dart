import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';

class AuthCustomField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final void Function()? iconOnTap;
  const AuthCustomField(
      {super.key,
      required this.labelText,
      required this.icon,
      required this.controller,
      required this.validator,
      this.keyboardType,
      this.obscureText,
      this.iconOnTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Get.height * 0.03),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(Get.width * 0.03),
        boxShadow: const [
          BoxShadow(
            color: AppColors.greyShadow,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.075, vertical: Get.height * 0.015),
          labelText: labelText,
          labelStyle: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: AppColors.authText),
          suffixIcon: Padding(
            padding: EdgeInsetsDirectional.only(end: Get.width * 0.04),
            child: InkWell(
              onTap: iconOnTap,
              child: Icon(
                icon,
                color: AppColors.authText,
                size: Get.width * 0.055,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
