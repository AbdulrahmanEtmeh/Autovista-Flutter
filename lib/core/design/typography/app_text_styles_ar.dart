import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStylesAr {
  static const String _primaryFont = 'Cairo';
  static const String _secondaryFont = 'Vollkorn_SC';

  static TextStyle _base({
    required double fontSize,
    required FontWeight fontWeight,
    required String fontFamily,
    required Color color,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      color: color,
    );
  }
}
