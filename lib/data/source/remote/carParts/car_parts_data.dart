import 'package:graduation_project/core/constant/app_links.dart';

import '../../../../core/class/crud.dart';

class CarPartsData {
  Crud crud;
  CarPartsData(this.crud);
  getBrands() async {
    var response = await crud.getDataHeader(
      AppLinks.carPartsBrands,
    );
    return response.fold((l) => l, (r) => r);
  }

  getCarPartsCategories() async {
    var response = await crud.getDataHeader(
      AppLinks.carPartsCategories,
    );
    return response.fold((l) => l, (r) => r);
  }

  getCarPartsItems(int brandId, int categoryId) async {
    var response = await crud.getDataHeader(
      "${AppLinks.carPartsItems}/${brandId.toString()}/categories/${categoryId.toString()}",
    );
    return response.fold((l) => l, (r) => r);
  }
}
