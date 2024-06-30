import 'package:flutter_application_get_x/shared/keys.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageData extends GetxService {
  late GetStorage _db;
 
  //Storage en local ==> get_storage
  //Init Storage
  Future<StorageData> init() async {
    _db = GetStorage();
     await _db.writeIfNull(keyFiliere, []);
    return this;
  }
  //read
   T read<T>(String key){
       return _db.read(key);
   }
  //Write
   void  write(String key, dynamic value)async {
        await _db.writeIfNull(keyFiliere, value);
   }
  }
