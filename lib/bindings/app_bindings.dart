import 'package:get/get.dart';
import 'package:graduation_project/controller/auth/register_controller.dart';
import 'package:graduation_project/core/class/crud.dart';
import 'package:graduation_project/core/services/auth_services.dart';

import '../controller/auth/login_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginControllerImp(), fenix: true);
    Get.lazyPut(() => RegisterControllerImp(), fenix: true);
    Get.put(Crud());
    Get.lazyPut(() => AuthServicesImpl(), fenix: true);
  }
}
