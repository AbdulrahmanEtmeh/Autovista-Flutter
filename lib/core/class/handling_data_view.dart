import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_image_asset.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loadingLottie,
                width: 250, height: 250))
        : statusRequest == StatusRequest.offlineFailure
            ? const _StatusMessage(message: 'Offline')
            : statusRequest == StatusRequest.serverFailure
                ? _StatusMessage(message: 'server_failure'.tr)
                : statusRequest == StatusRequest.serverException
                    ? _StatusMessage(message: 'server_failure'.tr)
                : statusRequest == StatusRequest.failure
                    ? const _StatusMessage(message: 'No Data')
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loadingLottie,
                width: Get.width * 0.6, height: Get.height * 0.3))
        : statusRequest == StatusRequest.offlineFailure
            ? _StatusMessage(message: 'offline_failure'.tr)
            : statusRequest == StatusRequest.serverFailure
                ? _StatusMessage(message: 'server_failure'.tr)
                : statusRequest == StatusRequest.serverException
                    ? _StatusMessage(message: 'server_failure'.tr)
                : widget;
  }
}

class _StatusMessage extends StatelessWidget {
  final String message;

  const _StatusMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.primaryWhite,
            fontSize: Get.width * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
