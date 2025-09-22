import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/home/home_page_controller.dart';

import '../../../../core/constant/app_links.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../data/model/car_model.dart';
import 'home_search_red_container.dart';

class SearchList extends GetView<HomePageControllerImp> {
  final List<CarModel> listCarsModel;
  const SearchList({
    super.key,
    required this.listCarsModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listCarsModel.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.moveToCarDetails(listCarsModel[index]);
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.homeContainers,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: AppColors.primaryRed.withOpacity(0.4),
                width: 1,
              ),
            ),
            height: Get.height * 0.18,
            margin: EdgeInsets.only(
                top: Get.height * 0.025,
                left: Get.width * 0.03,
                right: Get.width * 0.03),
            child: LayoutBuilder(
              builder: (context, constraints) => Card(
                color: AppColors.homeContainers,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: constraints.maxHeight * 0.1,
                      horizontal: constraints.maxWidth * 0.03),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl:
                              '${AppLinks.imageRoot}/${listCarsModel[index].photos![0]}',
                          height: constraints.maxHeight * 0.8,
                          width: constraints.maxWidth * 0.35,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(width: constraints.maxWidth * 0.05),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              listCarsModel[index].name!,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: AppColors.primaryWhite,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Row(
                              children: controller.ratingStars(
                                  carRating: listCarsModel[index].rating!,
                                  iconSize: Get.height * 0.025),
                            ),
                            Text(
                              '\$ ${listCarsModel[index].price!}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: AppColors.carDetailsGrey,
                                      fontWeight: FontWeight.w500),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                HomeSearchRedContainer(
                                    text: '${listCarsModel[index].date}',
                                    boxConstraints: constraints),
                                HomeSearchRedContainer(
                                    text: '${listCarsModel[index].date}',
                                    boxConstraints: constraints),
                                HomeSearchRedContainer(
                                    text: '${listCarsModel[index].brand}',
                                    boxConstraints: constraints)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
