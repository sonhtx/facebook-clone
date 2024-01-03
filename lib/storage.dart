import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'models/UserLogin.dart';



const storage = FlutterSecureStorage();

// Save JWT to secure storage
Future<void> saveUser(UserLogin user) async {
  await storage.write(key: 'id', value: user.id.toString());
  await storage.write(key: 'email', value: user.email );
  await storage.write(key: 'username', value: user.username );
  await storage.write(key: 'token', value: user.token);
  await storage.write(key: 'avatar', value: user.avatar.toString());
  await storage.write(key: 'active', value: user.active.toString());
  await storage.write(key: 'coins', value: user.coins.toString());
}

// token
Future<void> setToken(String token) async {
  await storage.write(key: 'token', value: token);
}
Future<String?> getJwt() async {
  return await storage.read(key: 'token');
}

// coin
Future<void> setCoin(String coin) async{
  await storage.write(key: 'coins', value: coin);
}
Future<String?> getCoin(){
  return storage.read(key: 'coins');
}

Future<String?> getUserName() async {
  return await storage.read(key: 'username');
}

Future<String?> getAvatarUrl() async {
  return await storage.read(key: 'avatar');
}

Future<String?> getId(){
  return storage.read(key: 'id');
}

Future<String?> getEmail(){
  return storage.read(key: 'email');
}

// verify-code
void saveVerifyCode(String code){
  storage.write(key: 'verify_code', value : code);
}
Future<String?> getVerifyCode(){
  return storage.read(key: 'verify_code');
}

Future<void> deleteAllSecureStorageData() async {
  await storage.deleteAll();
}