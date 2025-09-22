import 'package:graduation_project/core/constant/app_links.dart';

import '../../../../core/class/crud.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(int partId) async {
    var response = await crud.postDataHeader(
      AppLinks.cartAdd,
      {
        'partId': partId.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  removeCart(int partId) async {
    var response = await crud.deleteHeader(
      "${AppLinks.cartRemove}/${partId.toString()}",
    );
    return response.fold((l) => l, (r) => r);
  }

  getCartItems() async {
    var response = await crud.getDataHeader(
      AppLinks.cartView,
    );
    return response.fold((l) => l, (r) => r);
  }
}
