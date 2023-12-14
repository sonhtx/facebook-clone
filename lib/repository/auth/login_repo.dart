

import 'package:anti_fb/storage.dart';

import '../../api/auth/login_api.dart';
import '../../models/UserLogin.dart';
import '../../models/request/ReqLoginData.dart';

class LoginRepository {

  Future<bool> login(LoginData loginData) async {
    try {
      final loginResult = await LoginApi.login(loginData);
      if(loginResult != null){
        UserLogin user = UserLogin.fromJson(loginResult);
        saveUser(user); // save information to storage
        return true;
      } else {
        return false; // Signup failed
      }
    } catch (e) {
      print(e);
      return false; // Signup failed due to an error
    }
  }


}


