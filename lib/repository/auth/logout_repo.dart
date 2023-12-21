
import 'package:anti_fb/api/auth/logout_api.dart';
import 'package:anti_fb/storage.dart';

class LogoutRepository{

  Future<bool> logout() async{
    try{
      final logoutResult = await LogoutApi().logout();
      if(logoutResult != null){
        deleteAllSecureStorageData();
        return true;
      }else{
        return false;
      }
    }catch (e) {
      print(e);
      return false; // Signup failed due to an error
    }
  }
}