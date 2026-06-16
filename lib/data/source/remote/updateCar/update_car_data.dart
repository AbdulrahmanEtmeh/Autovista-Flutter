import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_links.dart';
import 'package:graduation_project/core/services/my_services.dart';
import 'package:http/http.dart' as http;

class UpdateCarData {
  MyServices myServices = Get.find();

  http.MultipartRequest createRequest(int carId) {
    return http.MultipartRequest(
      'POST', // Laravel uses POST + _method=PUT for form-data
      Uri.parse('${AppLinks.cars}/$carId'),
    );
  }

  Future<http.StreamedResponse> updateCar(
      http.MultipartRequest request) async {
    request.headers.addAll({
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${myServices.sharedPreferences.getString("token")}',
    });

    return await request.send();
  }
}