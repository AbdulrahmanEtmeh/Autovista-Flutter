import 'package:graduation_project/core/constant/app_links.dart';

import '../../../../core/class/crud.dart';

class FilterData {
  Crud crud;
  FilterData(this.crud);

  getData(
    String brandName,
    String name,
    String gearType,
    String styleName,
    int capacity,
    List cylinders,
    int rent,
  ) async {
    final body = {
      'brandName': brandName,
      'name': name,
      'gearType': gearType,
      'styleName': styleName,
      'capacity': capacity.toString(),
      'cylinders': cylinders,
      'rent': rent.toString(),
    };

    var response = await crud.postDataHeaderFilter(
      AppLinks.filter,
      body,
    );
    return response.fold((l) => l, (r) => r);
  }
}
