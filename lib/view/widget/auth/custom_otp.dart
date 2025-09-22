import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../core/constant/app_colors.dart';

class CustomOtp extends StatelessWidget {
  final void Function(String) onCodeChanged;
  final void Function(String) onSubmit;
  const CustomOtp(
      {super.key, required this.onCodeChanged, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
        numberOfFields: 5,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        borderRadius: BorderRadius.circular(20),
        borderColor: AppColors.greyShadow,
        borderWidth: 5,
        fieldWidth: 55,
        fieldHeight: 100,
        //set to true to show as box or false to show as dash
        showFieldAsBox: true,
        //runs when a code is typed in
        onCodeChanged: onCodeChanged,
        //runs when every textfield is filled
        onSubmit: onSubmit);
  }
}
