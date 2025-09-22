import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/class/status_request.dart';
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
            ? const Center(
                child: Text(
                  'Offline',
                ),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Text(
                      'server_failure'.tr,
                      style: TextStyle(
                        fontSize: Get.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : statusRequest == StatusRequest.failure
                    ? const Center(
                        child: Text(
                          'No Data',
                        ),
                      )
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
            ? Center(
                child: Text(
                  'offline_failure'.tr,
                  style: TextStyle(
                    fontSize: Get.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Text(
                      'server_failure'.tr,
                      style: TextStyle(
                        fontSize: Get.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : widget;
  }
}
