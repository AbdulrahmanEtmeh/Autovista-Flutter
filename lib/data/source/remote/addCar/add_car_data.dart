import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_links.dart';
import 'package:graduation_project/core/services/my_services.dart';

class AddCarData {
  MyServices myServices = Get.find();

  Future<http.StreamedResponse> addCar(
    http.MultipartRequest request,
  ) async {
    request.headers.addAll({
      "Accept": "application/json",
      "Authorization":
          "Bearer ${myServices.sharedPreferences.getString("token")}",
    });

    return await request.send();
  }

  http.MultipartRequest createRequest() {
    return http.MultipartRequest(
      "POST",
      Uri.parse(AppLinks.cars),
    );
  }
}