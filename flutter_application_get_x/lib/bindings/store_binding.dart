import 'package:flutter_application_get_x/controllers/filiere_controller.dart';
import 'package:flutter_application_get_x/models/services/filiere_service.dart';
import 'package:get/get.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
      Get.lazyPut(() => FiliereController(filiereService: FiliereService()));
  }
  
}