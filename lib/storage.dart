import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'models/User.dart';



const storage = FlutterSecureStorage();

// Save JWT to secure storage
// Future<void> saveUser(User user) async {
//   await storage.write(key: 'id', value: user.id.toString());
//   await storage.write(key: 'firstname', value: user.firstname ?? '');
//   await storage.write(key: 'lastname', value: user.lastname ?? '');
//   await storage.write(key: 'token', value: user.token);
//   await storage.write(key: 'avatar', value: user.avatar.toString());
//   await storage.write(key: 'active', value: user.active.toString());
//   await storage.write(key: 'coins', value: user.coins.toString());
// }

void saveUser(User user){
  storage.write(key: 'id', value: user.id);
  storage.write(key: 'email', value: user.email );
  storage.write(key: 'username', value: user.username );
  storage.write(key: 'token', value: user.token);
  storage.write(key: 'avatar', value: user.avatar);
  storage.write(key: 'active', value: user.active);
  storage.write(key: 'coins', value: user.coins.toString());
}
void saveVerifyCode(String code){
  storage.write(key: 'verify_code', value : code);
}

// Retrieve JWT from secure storage
Future<String?> getJwt() async {
  return await storage.read(key: 'token');
}

Future<String?> getName() async {
  return await storage.read(key: 'firstname');
}

Future<String?> getCoin(){
  return storage.read(key: 'coins');
}
Future<String?> getId(){
  return storage.read(key: 'id');
}

Future<String?> getEmail(){
  return storage.read(key: 'email');
}
Future<String?> getVerifyCode(){
  return storage.read(key: 'verify_code');
}


Future<void> printJwt()async {
  print(await getJwt());
}
Future<void> printCoin()async {
  print(await getCoin());
}

Future<void> deleteAllSecureStorageData() async {
  await storage.deleteAll();
}