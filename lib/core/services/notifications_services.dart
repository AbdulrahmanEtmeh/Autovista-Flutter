// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:get/get.dart';

// import '../../data/source/remote/auth/firebase/notification_data.dart';
// import '../class/status_request.dart';
// import '../function/handling_data.dart';

// class NotificationsServices {
//   StatusRequest? statusRequest = StatusRequest.none;
//   NotificationData notifacationData = NotificationData(Get.find());

//   Future<void> getAndSendFcmToken() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;

//     String? token = await messaging.getToken();
//     print("FCM Token: $token");

//     if (token != null) {
//       await sendTokenToBackend(token);
//     }
//   }

//   Future<void> sendTokenToBackend(String fcmToken) async {
//     statusRequest = StatusRequest.loading;
//     var response = await notifacationData.postData(fcmToken);
//     statusRequest = handlingData(response);
//     if (statusRequest == StatusRequest.success) {
//       if (response['status'] == "success") {
//         print("FCM token sent successfully to the backend.");
//       } else if (response['status'] == false) {
//         statusRequest = StatusRequest.failure;
//         print(
//             "Failed to send FCM token to the backend: ${response['message']}");
//       }
//     } else {
//       print("Error in sending FCM token: $statusRequest");
//     }
//   }
// }
