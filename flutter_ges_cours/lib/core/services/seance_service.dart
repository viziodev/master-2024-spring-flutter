import 'package:dio/dio.dart';
import 'package:flutter_ges_cours/core/models/seance_model.dart';
import 'package:flutter_ges_cours/core/services/api.url.dart';

class SeanceService {
  static String  url="${environnement["dev"]!["url"]}/seances";
  static Dio dio=Dio();
  static  Future<List<SeanceModel>> findAll({String uri="date"})async {
       String path="$url/$uri";
        final response=  await dio.get(path);
        List<SeanceModel> seanceList=[];
             if (response.statusCode==200) {
                List<dynamic> datas=response.data["results"];
          
              for (var data in datas) {
                print(data["cours"]);
               try {
                   seanceList.add( SeanceModel.fromMap(data));
                 } catch (e) {
                   print(e);
                }
               
               }
             
            return seanceList;
        } else{
          
             throw response;
        } 
   }
}