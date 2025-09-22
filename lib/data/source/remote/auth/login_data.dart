import 'package:graduation_project/core/constant/app_links.dart';

import '../../../../core/class/crud.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postData(String email, String password) async {
    var response = await crud.postData(
      AppLinks.login,
      {
        'email': email,
        'password': password,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
