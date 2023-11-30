

import 'package:anti_fb/storage.dart';

import '../../data/auth/login_api.dart';
import '../../models/request/ReqLoginData.dart';
import '../../models/User.dart';

class LoginRepository {

  Future<bool> login(LoginData loginData) async {
    try {
      final loginResult = await LoginApi.login(loginData);
      if(loginResult != null){
        User user = User.fromJson(loginResult);
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


