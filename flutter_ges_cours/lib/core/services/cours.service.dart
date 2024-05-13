import 'package:dio/dio.dart';
import 'package:flutter_ges_cours/core/models/home.model.dart';
import 'package:flutter_ges_cours/core/services/api.url.dart';

class CoursService {
  static String  url="${environnement["dev"]!["url"]}/cours/status/STARTED";
  static Dio dio=Dio();
 static  Future<List<CoursModel>> findAll()async {
        final response=  await dio.get(url);
        List<CoursModel> coursList=[];
             if (response.statusCode==200) {
            List<dynamic> datas=response.data["results"];
            for (var data in datas) {
              coursList.add( CoursModel.fromMap(data));
            }
          
            return coursList;
        } else{
             throw response;
        } 
  }
}