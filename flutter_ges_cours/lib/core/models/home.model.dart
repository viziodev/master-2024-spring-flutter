// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CoursModel {
    String status;
    String professor;
    ClassRoomModel classRoom;
    int totalHeure;
    int totalHeurePlanifier;
    int totalHeureRealiser;
    String icon;
    String module;
    int id;
  CoursModel({
    required this.status,
    required this.professor,
    required this.classRoom,
    required this.totalHeure,
    required this.totalHeurePlanifier,
    required this.totalHeureRealiser,
    required this.icon,
    required this.module,
    required this.id,
  });
  


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'professor': professor,
      'classRoom': classRoom.toMap(),
      'totalHeure': totalHeure,
      'totalHeurePlanifier': totalHeurePlanifier,
      'totalHeureRealiser': totalHeureRealiser,
      'icon': icon,
      'module': module,
      'id': id,
    };
  }

  factory CoursModel.fromMap(Map<String, dynamic> map) {
    return CoursModel(
      status: map['status'] as String,
      professor: map['professor'] as String,
      classRoom: ClassRoomModel.fromMap(map['classRoom'] as Map<String,dynamic>),
      totalHeure: map['totalHeure'] as int,
      totalHeurePlanifier: map['totalHeurePlanifier'] as int,
      totalHeureRealiser: map['totalHeureRealiser'] as int,
      icon: map['icon'] as String,
      module: map['module'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoursModel.fromJson(String source) => CoursModel.fromMap(json.decode(source) as Map<String, dynamic>);
}


class ClassRoomModel {
    String nom;
    int id;
    ClassRoomModel({
        required this.nom,
        required this.id,
    });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nom': nom,
      'id': id,
    };
  }
  factory ClassRoomModel.fromMap(Map<String, dynamic> map) {
    return ClassRoomModel(
      nom: map['nom'] as String,
      id: map['id'] as int,
    );
  }
  String toJson() => json.encode(toMap());
  factory ClassRoomModel.fromJson(String source) => ClassRoomModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
