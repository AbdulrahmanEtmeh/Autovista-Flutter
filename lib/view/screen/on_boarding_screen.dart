import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onBoarding/on_boarding_controller.dart';
import '../../data/source/static/static.dart';
import '../widget/onBoarding/custom_black_button.dart';
import '../widget/onBoarding/description_container.dart';
import '../widget/onBoarding/header_texts.dart';
import '../widget/onBoarding/page_indicator.dart';
import '../widget/onBoarding/next_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingControllerImp controller = Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.onPageChanged(value);
        },
        itemCount: onBordingList.length,
        itemBuilder: (context, index) => Stack(
          children: [
            Image.asset(
              onBordingList[index].imageUrl,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Get.width * 0.05,
                right: Get.width * 0.05,
                top: Get.height * 0.1,
                bottom: Get.height * 0.05,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.15,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: HeaderTexts(
                          index: index,
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.05),
                    DecriptionContainer(index: index),
                    Padding(
                      padding: EdgeInsets.only(
                        left: Get.width * 0.07,
                        right: Get.width * 0.07,
                        top: Get.height * 0.075,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const PageIndicator(),
                          // For showing the red button only in the first two pages
                          index == 0 || index == 1
                              ? const NextButton()
                              : const CusotmBlackButton()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
