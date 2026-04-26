import 'package:graduation_project/core/class/status_request.dart';
import 'package:graduation_project/core/network/api_response.dart';

handlingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}

StatusRequest handlingApiResponse<T>(ApiResponse<T> response) {
  if (response is ApiFailure<T>) {
    return response.statusRequest;
  }
  return StatusRequest.success;
}

// StatusRequest handlingData(response) {
//   if (response['status'] == true) {
//     return StatusRequest.success; // Successful registration
//   } else {
//     return StatusRequest.serverFailure; // Handle server failure
//   }
// }
