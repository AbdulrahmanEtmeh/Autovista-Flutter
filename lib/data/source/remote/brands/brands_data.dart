import 'package:graduation_project/core/constant/app_links.dart';

import '../../../../core/class/crud.dart';

class BrandsData {
  Crud crud;
  BrandsData(this.crud);
  getCarsBrands(int brandId) async {
    var response = await crud.getDataHeader(
      "${AppLinks.brands}/${brandId.toString()}/cars",
    );
    return response.fold((l) => l, (r) => r);
  }
}
