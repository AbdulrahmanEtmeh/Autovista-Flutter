import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/class/handling_data_view.dart';
import 'package:graduation_project/core/function/custom_app_bar.dart';
import 'package:graduation_project/view/widget/search/filtration_button.dart';
import 'package:graduation_project/view/widget/search/search_by_name_field.dart';

import '../../../controller/my_drawer_controller.dart';
import '../../../controller/search/search_screen_controller.dart';
import '../../widget/search/list_products_search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyDrawerController drawerController = Get.put(MyDrawerController());
    SearchScreenControllerImp searchController =
        Get.put(SearchScreenControllerImp());
    return Scaffold(
      appBar: drawerAppBar(
        context,
        title: 'Search'.tr,
        onPressed: () {
          drawerController.drawerKey.currentState!.openDrawer();
        },
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(
            horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SearchByNameField(
                      onChanged: (val) {
                        // searchController.checkSerach(val);
                      },
                      myController: searchController.searchFieldController!,
                      onPressedSearch: () {
                        searchController.onSerachItems();
                      },
                    ),
                  ),
                  SizedBox(width: Get.width * 0.02),
                  const FiltrationButton(),
                ],
              ),
              SizedBox(height: Get.height * 0.025),
              GetBuilder<SearchScreenControllerImp>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListProductsSearch(listCars: controller.listCars),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
