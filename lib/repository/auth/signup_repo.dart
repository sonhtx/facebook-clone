

import 'package:anti_fb/models/request/ReqSignupData.dart';

import '../../api/auth/signup_api.dart';
import '../../storage.dart';

class SignupRepository {
  static Future<bool> signupUser(SignupData signupData) async {
    try {
      final signupResult = await SignupApi.signup(signupData);
      if(signupResult){
        String verifyCode = signupResult['data']['verify_code'] as String;
        saveVerifyCode(verifyCode);
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


