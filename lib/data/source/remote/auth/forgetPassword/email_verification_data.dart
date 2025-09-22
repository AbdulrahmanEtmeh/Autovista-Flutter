import 'package:graduation_project/core/constant/app_links.dart';

import '../../../../../core/class/crud.dart';

class EmailVerificationData {
  Crud crud;
  EmailVerificationData(this.crud);
  postData(String email, String verifyCode) async {
    var response = await crud.postData(AppLinks.registerCheckEmail, {
      'email': email,
      'code': verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
