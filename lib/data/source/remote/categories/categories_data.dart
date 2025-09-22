import 'package:graduation_project/core/constant/app_links.dart';

import '../../../../core/class/crud.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);
  getCarsCategories(int styleId) async {
    var response = await crud.getDataHeader(
      "${AppLinks.categories}/${styleId.toString()}/cars",
    );
    return response.fold((l) => l, (r) => r);
  }
}
