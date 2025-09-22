
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_project/core/constant/app_links.dart';

import '../../../../../core/class/crud.dart';

class GoogleLoginData {
  Crud crud;
  GoogleLoginData(this.crud);
  postData(String idToken, User user) async {
    var response = await crud.postDataHeaderFirebase(
        AppLinks.signInWithGoogle,
        {
          'userName': user.displayName,
          'email': user.email,
        },
        idToken);
    return response.fold((l) => l, (r) => r);
  }
}
