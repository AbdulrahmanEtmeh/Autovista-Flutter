import 'package:graduation_project/core/constant/app_links.dart';

import '../../../../core/class/crud.dart';

class LogOutData {
  Crud crud;
  LogOutData(this.crud);
  postData() async {
    var response = await crud.postDataHeader(
      AppLinks.logout,
      {},
    );
    return response.fold((l) => l, (r) => r);
  }
}
