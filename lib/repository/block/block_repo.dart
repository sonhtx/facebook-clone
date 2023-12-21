
import 'package:anti_fb/api/block/block_api.dart';
import 'package:anti_fb/models/block/UserBlocked.dart';
import 'package:anti_fb/models/request/ReqListBlocked.dart';

class BlockRepo{
  final BlockApi blockApi = BlockApi();

  Future getListBlocked(RequestListBlock requestListBlock) async{
    try{
      final getListBlockedResult = await blockApi.getListBlock(requestListBlock.index, requestListBlock.count);
      if(getListBlockedResult == null){
        return false;
      }

      List<UserBlocked> listBlocked = [];
      List<dynamic> listBlockedRaw = getListBlockedResult['data'];

      for(dynamic x in listBlockedRaw){
        UserBlocked userBlocked = UserBlocked.fromJson(x);
        listBlocked.add(userBlocked);
      }
      print(listBlocked.length);
      return listBlocked;
    }
    catch(e){
      print(e);
      return null;
    }
  }
}