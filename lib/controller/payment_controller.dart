import 'package:get/get.dart';

class PaymentController extends GetxController {
  late double price;
  late double vat;
  late double totalPrice;

  @override
  void onInit() {
    price = Get.arguments['price'];
    vat = Get.arguments['vat'];
    totalPrice = Get.arguments['totalPrice'];
    super.onInit();
  }
}
