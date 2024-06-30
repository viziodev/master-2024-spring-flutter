// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_get_x/models/entity/filiere.dart';
import 'package:flutter_application_get_x/models/services/filiere_service.dart';
import 'package:get/get.dart';

class FiliereController extends GetxController {
    FiliereService  filiereService;
    final filieres= <Filiere>[
        Filiere(libelle: "CDSD"),
        Filiere(libelle: "GLRS")
    ].obs;
    final libelleFiliereController=TextEditingController();
    FiliereController({
      required this.filiereService,
    });
    
   @override
  void onInit() {
    // TODO: implement onInit
      super.onInit();
      var list=  filiereService.findAll();
      if(list!=null) filieres.assignAll(list);
      ever(filieres, (_) => filiereService.save(filieres.value));
  }

  

  
  
}
