import 'package:graduation_project/core/constant/app_links.dart';

import '../../../../core/class/crud.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addFavorite(int carId) async {
    var response = await crud.postDataHeader(
      AppLinks.favoriteAdd,
      {
        'carId': carId.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(int carId) async {
    var response = await crud.deleteHeader(
      "${AppLinks.deleteFromFavorite}/${carId.toString()}",
    );
    return response.fold((l) => l, (r) => r);
  }

  getFavoriteList(int userId) async {
    var response = await crud.getDataHeader(
      AppLinks.favoriteView,
    );
    return response.fold((l) => l, (r) => r);
  }
}
