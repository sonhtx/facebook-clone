

import 'package:anti_fb/storage.dart';

import '../data/auth/getverifycode_api.dart';

class GetVerifyCodeRepository {

  static Future getVerifyCode(String email) async {
    try {
      final getVrfResult = await GetVerifyCodeApi.getVerifyCode(email);
      if(getVrfResult){
        String verifyCode = getVrfResult['data']['verify_code'] as String;
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


