

import 'package:anti_fb/models/request/ReqSignupData.dart';

import '../../api/auth/signup_api.dart';

class SignupRepository {
  static Future signupUser(SignupData signupData) async {
    try {
        final signupResult = await SignupApi.signup(signupData);
        String verifyCode = signupResult['data']['verify_code'] as String;

        return verifyCode;
      } catch (e) {
      print(e);
      return false; // Signup failed due to an error
    }
  }
}


