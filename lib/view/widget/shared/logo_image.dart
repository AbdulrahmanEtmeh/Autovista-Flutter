import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_image_asset.dart';

class LogoImage extends StatelessWidget {
  final double height;
  final double width;
  const LogoImage({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.asset(
        AppImageAsset.logoImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
