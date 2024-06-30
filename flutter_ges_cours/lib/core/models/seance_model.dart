import 'dart:convert';

import 'package:flutter_ges_cours/core/models/home.model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SeanceModel {
     String endTime;
     String status;
     String startTime;
     int id;
     CoursModel cours;
     String date;
     double duree;
     SeanceModel({
        required this.endTime,
        required this.status,
        required this.startTime,
        required this.id,
        required this.cours,
        required this.date,
        this.duree=0
    });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'endTime': endTime,
      'status': status,
      'startTime': startTime,
      'id': id,
      'cours': cours.toMap(),
      'date': date,
    };
  }

  factory SeanceModel.fromMap(Map<String, dynamic> map) {
     String endTime= (map['endTime'] as String).substring(0,5);
     String startTime =(map['startTime'] as String).substring(0,5);
     print( CoursModel.fromMap(map['cours'] as Map<String,dynamic>));
    return SeanceModel(
      endTime: endTime,
      status: map['status'] as String,
      startTime:startTime,
      id: map['id'] as int,
      cours: CoursModel.fromMap(map['cours'] as Map<String,dynamic>),
      date: (map['date'] as String).split("-").reversed.join("-"),
      duree: double.parse(endTime.replaceFirst(":", "."))-double.parse(startTime.replaceFirst(":", "."))
    );
  }


  String toJson() => json.encode(toMap());

  factory SeanceModel.fromJson(String source) => SeanceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

 
  

