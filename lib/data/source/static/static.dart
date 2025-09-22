import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_image_asset.dart';
import 'package:graduation_project/data/model/on_boarding_model.dart';

List<OnBoardingModel> onBordingList = [
  OnBoardingModel(
      title: 'onBoarding_one_title'.tr,
      subTitle: 'onBoarding_one_subtitle'.tr,
      description: 'onBoarding_one_description'.tr,
      features: [
        'onBoarding_one_features_one'.tr,
        'onBoarding_one_features_two'.tr,
        'onBoarding_one_features_three'.tr,
        'onBoarding_one_features_four'.tr,
      ],
      imageUrl: AppImageAsset.onBordingImageOne),
  OnBoardingModel(
      title: 'onBoarding_two_title'.tr,
      subTitle: 'onBoarding_two_subtitle'.tr,
      description: 'onBoarding_two_description'.tr,
      features: [
        'onBoarding_two_features_one'.tr,
        'onBoarding_two_features_two'.tr,
        'onBoarding_two_features_three'.tr,
      ],
      imageUrl: AppImageAsset.onBordingImageTwo),
  OnBoardingModel(
      title: 'onBoarding_three_title'.tr,
      subTitle: 'onBoarding_three_subtitle'.tr,
      description: 'onBoarding_three_description'.tr,
      features: [
        'onBoarding_three_features_one'.tr,
        'onBoarding_three_features_two'.tr,
        'onBoarding_three_features_three'.tr,
      ],
      imageUrl: AppImageAsset.onBordingImageThree)
];
