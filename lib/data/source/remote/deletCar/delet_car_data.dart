import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_links.dart';
import 'package:graduation_project/core/services/my_services.dart';
import 'package:http/http.dart' as http;

class DeleteCarData {
  MyServices myServices = Get.find();

  Future<http.Response> deleteCar(int carId) async {
    final uri = Uri.parse('${AppLinks.cars}/$carId');

    return await http.delete(
      uri,
      headers: {
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${myServices.sharedPreferences.getString("token")}',
      },
    );
  }
}