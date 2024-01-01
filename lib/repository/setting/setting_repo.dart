
import 'package:anti_fb/api/setting/setting_api.dart';
import 'package:anti_fb/models/request/ReqSetNotification.dart';
import 'package:anti_fb/models/setting/PushSettingsData.dart';

class SettingRepository {
  final SettingApi _settingApi = SettingApi();
  Future getPushSettings() async{
    try{
      final getPushSettingsResult = await _settingApi.getPushSettings();
      if(getPushSettingsResult == null){
        return null;
      }

      dynamic pushSettingRaw = getPushSettingsResult['data'];

      PushSettingsData pushSetting = PushSettingsData.fromJson(pushSettingRaw);

      return pushSetting;
    }catch(e){
      print(e);
      return null;
    }
  }

  Future setPushNotification(RequestSetNotification requestSetNotification)async{
    try{
      final setPushNotificationResult = await _settingApi.setPushSettings(requestSetNotification);
      if(setPushNotificationResult == null){
        return null;
      }
    }catch(e){
      print(e);
      return null;
    }
  }
}