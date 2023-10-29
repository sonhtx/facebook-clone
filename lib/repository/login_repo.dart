

import 'package:anti_fb/storage.dart';

import '../data/auth/login_api.dart';
import '../models/LoginData.dart';
import '../models/User.dart';

class LoginRepository {

  Future<bool> login(LoginData loginData) async {
    try {
      final signupResult = await LoginApi.login(loginData);
      if(signupResult != false){
        User user = User.fromJson(signupResult);
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


