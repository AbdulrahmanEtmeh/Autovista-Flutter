import 'package:graduation_project/core/constant/app_links.dart';

import '../../../../core/class/crud.dart';

class RegisterData {
  Crud crud;
  RegisterData(this.crud);
  postData(String userName, String email, String password) async {
    var response = await crud.postData(
      AppLinks.register,
      {
        'userName': userName,
        'email': email,
        'password': password,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
