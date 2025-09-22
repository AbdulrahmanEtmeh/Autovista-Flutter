import '../../../../../core/class/crud.dart';
import '../../../../../core/constant/app_links.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  sendFcmToken(String fcmToken) async {
    var response = await crud.postDataHeader(
      AppLinks.savaeFcmToken,
      {
        'fcm_token': fcmToken,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
