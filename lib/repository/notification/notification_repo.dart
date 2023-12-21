import 'package:anti_fb/api/notification/notification_api.dart';
import 'package:anti_fb/models/Notification/NotificationData.dart';
import 'package:anti_fb/models/request/ReqListNotification.dart';

class NotificationRepository{
  final NotificationApi _notificationApi = NotificationApi();
  Future getListNotification(RequestListNotification requestListNotification) async{
    try{
      final getListNotificationResult = await _notificationApi.getListNotification(requestListNotification);
      if(getListNotificationResult == null){
        return false;
      }

      List<NotificationData> listNotification = [];
      List<dynamic> listNotificationRaw = getListNotificationResult['data'];

      for(dynamic x in listNotificationRaw){
        NotificationData notification = NotificationData.fromJson(x);
        listNotification.add(notification);

      }
      return listNotification;
    }
    catch(e){
      print(e);
      return null;
    }
  }
}