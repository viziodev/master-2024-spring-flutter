import 'package:flutter/material.dart';
import 'package:flutter_application_get_x/controllers/filiere_controller.dart';
import 'package:flutter_application_get_x/models/entity/filiere.dart';
import 'package:flutter_application_get_x/models/services/filiere_service.dart';
import 'package:flutter_application_get_x/shared/widgets/rounded_input.dart';
import 'package:flutter_application_get_x/shared/widgets/side_drawer.dart';
import 'package:get/get.dart';

class AddFiliere extends StatelessWidget {
  AddFiliere({super.key});
  final filiereController = Get.find<FiliereController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideDrawer(),
        appBar: AppBar(
          title: const Text("Getx Concepts"),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
          elevation: 0.00,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              RoundedInput(
                hintText: "Libelle",
                controller: filiereController.libelleFiliereController,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    filiereController.filieres.add(Filiere(
                        libelle:
                            filiereController.libelleFiliereController.text));
                    filiereController.libelleFiliereController.clear();
                    Get.snackbar(
                      'Added',
                      'Nouvelle Filiere ',
                      snackPosition: SnackPosition.TOP ,
                      forwardAnimationCurve: Curves.elasticInOut,
                      reverseAnimationCurve: Curves.easeOut,
                    );
                  },
                  child: const Text(
                    "Enregistrer",
                    style: TextStyle(fontSize: 18),
                  )),
              const SizedBox(
                height: 20,
              ),
              Obx(() => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filiereController.filieres.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(filiereController.filieres[index].libelle,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      );
                    },
                  ))
            ],
          ),
        )));
  }
}
