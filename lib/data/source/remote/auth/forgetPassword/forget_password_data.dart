import 'package:graduation_project/core/constant/app_links.dart';

import '../../../../../core/class/crud.dart';

class ForgetPasswordData {
  Crud crud;
  ForgetPasswordData(this.crud);
  postData(String email) async {
    var response = await crud.postData(AppLinks.forgetPassword, {
      'email': email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
