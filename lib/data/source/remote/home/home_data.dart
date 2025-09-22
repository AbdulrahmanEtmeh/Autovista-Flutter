import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_links.dart';

import '../../../../core/class/crud.dart';
import '../../../../core/services/my_services.dart';

class HomeData {
  MyServices myServices = Get.find();
  Crud crud;
  HomeData(this.crud);
  getData(int userId) async {
    var response = await crud.getDataHeader(
      AppLinks.home,
    );
    return response.fold((l) => l, (r) => r);
  }

  serachData(String search) async {
    var response = await crud.getDataHeader(
      "${AppLinks.homeSearch}$search",
    );
    return response.fold((l) => l, (r) => r);
  }
}
