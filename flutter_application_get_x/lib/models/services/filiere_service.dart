import 'dart:convert';

import 'package:flutter_application_get_x/models/entity/filiere.dart';
import 'package:flutter_application_get_x/models/provider/provider.dart';
import 'package:flutter_application_get_x/shared/keys.dart';
import 'package:get/instance_manager.dart';

class FiliereService {
    final  StorageData _storageData=Get.find<StorageData>();
    //store
      void save(List<Filiere> filieres) {
         _storageData.write(keyFiliere, jsonEncode(filieres));
      }
    //show
    List<Filiere>?  findAll(){
       List<Filiere>  filieres=[];
        var data=  jsonDecode( _storageData.read(keyFiliere).toString());
       return data?.forEach((item)=>filieres.add(Filiere.fromMap(item)));
          
    }
}