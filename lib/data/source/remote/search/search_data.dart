import 'package:get/get.dart';

import '../../../../core/class/crud.dart';
import '../../../../core/constant/app_links.dart';
import '../../../../core/services/my_services.dart';

class SearchData {
  MyServices myServices = Get.find();
  Crud crud;
  SearchData(this.crud);
  serachData(String search) async {
    var response = await crud.getDataHeader(
      "${AppLinks.homeSearch}$search",
    );
    return response.fold((l) => l, (r) => r);
  }
}
