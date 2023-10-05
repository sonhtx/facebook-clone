

import 'package:anti_fb/models/SignupData.dart';

import '../../data/signup_api.dart';

class SignupRepository {
  static Future<bool> signupUser(SignupData signupData) async {
    try {
      final bool signupResult = await SignupApi.sendSignupInfor(signupData);

      if (signupResult) {
        // Additional logic can be added here if needed
        return true; // Signup successful
      } else {
        return false; // Signup failed
      }
    } catch (e) {
      print(e);
      return false; // Signup failed due to an error
    }
  }
}


