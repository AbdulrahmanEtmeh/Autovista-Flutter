import '../../../../core/constant/app_links.dart';
import '../../../../core/class/crud.dart';

class RegisterCheckEmailData {
  Crud crud;
  RegisterCheckEmailData(this.crud);
  postData(String email, String verifyCode) async {
    var response = await crud.postData(AppLinks.registerCheckEmail, {
      'email': email,
      'code': verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
