import 'package:graduation_project/core/class/status_request.dart';

handlingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}

// StatusRequest handlingData(response) {
//   if (response['status'] == true) {
//     return StatusRequest.success; // Successful registration
//   } else {
//     return StatusRequest.serverFailure; // Handle server failure
//   }
// }
