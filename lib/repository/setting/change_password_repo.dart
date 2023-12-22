
import 'package:anti_fb/storage.dart';

import '../../api/setting/change_password_api.dart';
import '../../models/request/ReqPasswordChange.dart';

class ChangePasswordRepository{
  Future changePassword(ReqChangePassword reqChangePassword) async{
    try{
      final result = await ChangePassWordApi().changePassword(reqChangePassword);
      print(result);
      if(result == null){
        return null;
      }
      if(result['code'] == "9990"){
        return false;
      }
      if(result['code'] == "1000"){
        setToken(result['data']['token']);
        return true;
      }

    }catch(e){
      print(e);
      return null;
    }
  }
}