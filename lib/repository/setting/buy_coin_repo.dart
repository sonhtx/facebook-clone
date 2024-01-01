import 'package:anti_fb/api/setting/setting_api.dart';
import 'package:anti_fb/storage.dart';

class BuyCoinRepo{
  final SettingApi _settingApi = SettingApi();
  Future buyCoin(String coin) async{
    try{
      final getBuyCoinResult = await _settingApi.buyCoins(coin);
      if(getBuyCoinResult == null){
        return null;
      }
      String newCoin = getBuyCoinResult['data']['coins'].toString();
      await setCoin(newCoin);
      return newCoin;
    }catch(e){
      print(e);
      return null;
    }
  }
}